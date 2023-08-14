//
//  AudioCoordinator.swift
//  HypnoloopsSwiftUI
//
//  Created by Olijujuan Green on 8/13/23.
//

import AVFoundation

class AudioCoordinator: NSObject, ObservableObject, AVAudioPlayerDelegate {
    @Published var isRecording = false
    @Published var isPlaying = false

    var audioRecorder: AVAudioRecorder?
    var audioPlayer: AVAudioPlayer?

    func toggleRecording() {
        if isRecording {
            let audioFilename = getDocumentsDirectory().appendingPathComponent("recording.wav")
            let settings: [String: Any] = [
                AVFormatIDKey: Int(kAudioFormatLinearPCM),
                AVSampleRateKey: 44100.0,
                AVNumberOfChannelsKey: 1,
                AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
            ]

            do {
                audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
                audioRecorder?.record()
            } catch {
                print("Error recording audio: \(error)")
            }
        } else {
            audioRecorder?.stop()
            audioRecorder = nil
        }
    }

    func togglePlayback() {
        if isPlaying {
            let audioFilename = getDocumentsDirectory().appendingPathComponent("recording.wav")
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: audioFilename)
                audioPlayer?.delegate = self
                audioPlayer?.play()
            } catch {
                print("Error playing audio: \(error)")
            }
        } else {
            audioPlayer?.stop()
            audioPlayer = nil
        }
    }

    private func getDocumentsDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        isPlaying = false
    }
}
