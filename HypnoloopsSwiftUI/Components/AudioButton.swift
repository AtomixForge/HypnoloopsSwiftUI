//
//  AudioButton.swift
//  HypnoloopsSwiftUI
//
//  Created by Olijujuan Green on 8/11/23.
//

import SwiftUI
import AVFoundation

enum AudioButtonType {
    case record
    case play
}

struct AudioButton: View {
    let type: AudioButtonType
    @ObservedObject var coordinator: AudioCoordinator

    var body: some View {
        Button(action: {
            print("IS RECORDING: ", coordinator.isRecording)

            switch type {
            case .record:
                if coordinator.isRecording {
                    coordinator.toggleRecording()
                    coordinator.isRecording = false
                } else {
                    coordinator.toggleRecording()
                    coordinator.isRecording = true
                }
            case .play:
                if coordinator.isPlaying {
                    coordinator.togglePlayback()
                    coordinator.isPlaying = false
                } else {
                    coordinator.togglePlayback()
                    coordinator.isPlaying = true
                }
            }


            switch type {
            case .record:
                coordinator.toggleRecording()
                coordinator.isRecording.toggle()
            case .play:
                coordinator.togglePlayback()
                coordinator.isPlaying.toggle()
            }
        }) {
            Circle()
                .opacity(0.3)
                .overlay {
                    Image(systemName: imageName)
                        .font(.system(size: 30))
                        .foregroundColor(imageColor)
                }
        }
        .frame(width: 80)
        .disabled(type == .play ? coordinator.isRecording : coordinator.isPlaying)
    }

    private var imageName: String {
        switch type {
        case .record:
            return coordinator.isRecording ? "stop.fill" : "mic"
        case .play:
            return coordinator.isPlaying ? "stop.fill" : "play.fill"
        }
    }

    private var imageColor: Color {
        switch type {
        case .record:
            return coordinator.isRecording ? .red : .primary
        case .play:
            return coordinator.isPlaying ? .red : .primary
        }
    }
}

struct AudioButton_Previews: PreviewProvider {
    static var previews: some View {
        let coordinator = AudioCoordinator()
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                AudioButton(type: .record, coordinator: coordinator)
                AudioButton(type: .play, coordinator: coordinator)
            }
            HStack(spacing: 20) {
                AudioButton(type: .record, coordinator: coordinator)
                    .disabled(true)
                AudioButton(type: .play, coordinator: coordinator)
                    .disabled(true)
            }
        }
    }
}
