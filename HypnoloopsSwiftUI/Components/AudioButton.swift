//
//  AudioButton.swift
//  HypnoloopsSwiftUI
//
//  Created by Olijujuan Green on 8/11/23.
//

import SwiftUI

enum AudioButtonType {
    case record
    case play
}

struct AudioButton: View {
    let type: AudioButtonType
    @Binding var isRecording: Bool
    @Binding var isPlaying: Bool

    var body: some View {
        Button(action: {
            type == .record ? isRecording.toggle() : isPlaying.toggle()
        }) {
            Image(systemName: imageName)
                .font(.system(size: 30))
                .foregroundColor(imageColor)
        }
        .disabled(type == .play ? isRecording : isPlaying)
    }

    private var imageName: String {
        switch type {
        case .record:
            return isRecording ? "mic.fill" : "mic"
        case .play:
            return isPlaying ? "pause.fill" : "play.fill"
        }
    }

    private var imageColor: Color {
            switch type {
            case .record:
                return isRecording ? .red : .primary
            case .play:
                return isPlaying ? .orange : .primary
            }
        }
}

struct AudioButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                AudioButton(type: .record, isRecording: .constant(false), isPlaying: .constant(false))
                AudioButton(type: .play, isRecording: .constant(false), isPlaying: .constant(false))
            }
            HStack(spacing: 20) {
                AudioButton(type: .record, isRecording: .constant(true), isPlaying: .constant(true))
                AudioButton(type: .play, isRecording: .constant(true), isPlaying: .constant(true))
            }
        }
    }
}

