//
//  RecordView.swift
//  hypnoLoops
//
//  Created by Joey Rubin on 7/31/23.
//

import SwiftUI

struct RecordView: View {
    @State private var sliderValue: Double = 0
    @ObservedObject private var audioCoordinator = AudioCoordinator()

    var body: some View {
        VStack {
                waveformImage

            List {
                Section(header: Text("Category of affirmation")) {
                    categoryAffirmationView
                }

                Section(header: Text("Name and save your recording")) {
                    fileNameInputView

                    Button(action: {

                        print("Save button pressed!")
                    }) {
                        Text("Save")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color.hlBlue)
                            .cornerRadius(8)
                    }
                }

                Section(header: Text("This may be deleted")) {
                    HStack {
                        Text("Reverb")
                            .font(.subheadline)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 5)
                        Slider(value: $sliderValue, in: 0 ... 50, step: 5) {
                            Text("Reverb Slider")
                        }
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                }
            }

            HStack(alignment: .center) {
                AudioButton(type: .record, coordinator: audioCoordinator)
//                    .disabled(audioCoordinator.isPlaying)
                    .padding(.horizontal, 20)

                AudioButton(type: .play, coordinator: audioCoordinator)
//                    .disabled(audioCoordinator.isRecording)
                    .padding(.horizontal, 20)
            }
            .padding(20)
        }
    }

    private var waveformImage: some View {
        Image(systemName: "waveform.path")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 150, alignment: .center)
            .padding(.horizontal, 10)
            .foregroundColor(.hlBlue)
    }

    private var categoryAffirmationView: some View {
        Text("Your affirmation will display here...")
            .font(.subheadline)
    }

    private var fileNameInputView: some View {
        HStack {
            Text("File Name")
                .font(.subheadline)
            Spacer()
        }
        .padding(.trailing, 5)
    }
}

struct RecordView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView()
    }
}

extension ShapeStyle where Self == Color {
    static var darkBackground: Color {
        Color(red: 0.1, green: 0.1, blue: 0.2)
    }
    
    static var hLoopIndigo: Color {
        Color(red: 0.055, green: 0.075, blue: 0.157)
    }
    
    static var darkGray: Color {
        Color(red: 0.145, green: 0.157, blue: 0.153)
    }
    
    static var hlBlue: Color {
        Color(red: 0.271, green: 0.682, blue: 0.890)
    }
}
