//
//  RecordView.swift
//  hypnoLoops
//
//  Created by Joey Rubin on 7/31/23.
//

import SwiftUI

struct RecordView: View {
    @State private var sliderValue: Double = 0
    
    var body: some View {
        ZStack {
            Color.hLoopIndigo
                .edgesIgnoringSafeArea(.all)
                
            VStack {
                HStack { // Category View
                    VStack(alignment: .leading) {
                        Text("Your First String")
                            .font(.headline)
                            .padding(.vertical, 10)
                            .foregroundColor(.white)
                        Text("Your Second String")
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Image(systemName: "waveform.path")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100, alignment: .center)
                        .padding(.horizontal, 10)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color(.darkGray)))
                .padding(.horizontal, 10)
                    
                HStack { // Affirmation View
                    Text("This is where the affirmation will be displayed")
                        .font(.subheadline)
                        .padding()
                        .foregroundColor(.white)
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading) // Set width to fill the available space.
                .background(RoundedRectangle(cornerRadius: 10).fill(Color(.darkGray)))
                .padding(.horizontal, 10)
                    
                HStack(alignment: .center) { // Record and Play Buttons
                    Button(action: {
                        // insert your action here
                        print("Button pressed!")
                    }) {
                        VStack {
                            Text("Record")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(5)
                                
                            Image(systemName: "record.circle")
                                .font(.title)
                                .foregroundColor(.white)
                        }
                        .frame(width: 100, height: 100, alignment: .center)
                        .padding(.all, 5)
                        .background(Circle().fill(Color.red))
                    }
                    .padding(.horizontal, 10)
                        
                    Button(action: {
                        // insert your action here
                        print("Button pressed!")
                    }) {
                        VStack {
                            Text("Play")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(5)
                                
                            Image(systemName: "play.fill")
                                .font(.title)
                                .foregroundColor(.white)
                        }
                        .frame(width: 100, height: 100, alignment: .center)
                        .padding(.all, 5)
                        .background(Circle().fill(Color.blue))
                    }
                    .padding(.horizontal, 10)
                }
                .padding(10)
                    
                HStack {
                    Text("Reverb")
                        .font(.headline)
                        .padding()
                        .foregroundColor(.white)
                    Slider(value: $sliderValue, in: 0 ... 50, step: 5) {
                        Text("")
                    }
                    .padding()
                }
                .frame(minWidth: 0, maxWidth: .infinity) // Set width to fill the available space.
                .background(RoundedRectangle(cornerRadius: 10).fill(Color(.darkGray)))
                .padding(.all, 10)
                    
                HStack {
                    HStack {
                        Text("File Name")
                            .font(.headline)
                            .padding(10)
                            .foregroundColor(.white)
                                            
                        Spacer()
                    }
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color(.darkGray)))
                    .padding(.all, 10)
                    HStack {
                        Button(action: {
                            // insert your action here
                            print("Save button pressed!")
                        }) {
                            Text("Save")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 10)
                                .background(Color.blue)
                                .cornerRadius(8)
                        }
                    }
                }
            }
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
}
