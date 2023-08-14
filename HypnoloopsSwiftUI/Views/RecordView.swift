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
            VStack {
                Image(systemName: "waveform.path")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 150, alignment: .center)
                    .padding(.horizontal, 10)
                    .foregroundColor(.hlBlue)
            }
            List {
                Section("Category of affirmation") {
                    HStack {
                        Text("Your affirmation will display here...")
                            .font(.subheadline)
                    }
                }
                Section("Name and save youer recording") {
                    HStack {
                        HStack {
                            Text("File Name")
                                .font(.subheadline)
                                                
                            Spacer()
                        }
                        .padding(.trailing, 5)
                        
                        HStack {
                            Button(action: {
                                // insert your action here
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
                    }
                }
                Section("This may be deleted") {
                    HStack {
                        Text("Reverb")
                            .font(.subheadline)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 5)
                        Slider(value: $sliderValue, in: 0 ... 50, step: 5) {
                            Text("")
                        }
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                }
            }
            HStack(alignment: .center) { // Record and Play Buttons

                AudioButton(type: .record, coordinator: audioCoordinator)
                    .disabled(audioCoordinator.isPlaying)
                    .padding(.horizontal, 20)
                AudioButton(type: .play, coordinator: audioCoordinator)
                    .disabled(audioCoordinator.isRecording)
                    .padding(.horizontal, 20)
            }
            .padding(20)
        }
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
