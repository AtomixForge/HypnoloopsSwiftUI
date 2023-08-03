//
//  RecordView2.swift
//  hypnoLoops
//
//  Created by Joey Rubin on 8/2/23.
//

import SwiftUI

struct RecordView2: View {
    @State private var sliderValue: Double = 0
    
    var body: some View {
        VStack {
            VStack {
                Image(systemName: "waveform.path")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 150, alignment: .center)
                    .padding(.horizontal, 10)
                    .foregroundColor(Color.hlBlue)
            }
            List {
                Section("Category of affirmation") {
                    
                    HStack {
                        Text("Your affirmation will display here...")
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                    .listRowBackground(Color.darkGray)
                }
                .foregroundColor(.hlBlue)
                
                Section("Name and save youer recording") {
                    HStack {
                        HStack {
                            Text("File Name")
                                .font(.subheadline)
                            Spacer()
                        }
                        .foregroundColor(.white)
                        .padding(.trailing, 5)
                        
                        HStack {
                            Button(action: {
                                // insert your action here
                                print("Saev pressed!")
                            }) {
                                Text("Save")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 10)
                                    .background(Color.hlBlue)
                                    .cornerRadius(8)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .listRowBackground(Color.darkGray)
                }
                .foregroundColor(.hlBlue)
                
                Section("This may be deleted") {
                    HStack {
                        Text("Reverb")
                            .font(.subheadline)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 5)
                            //.foregroundColor(.white)
                        Slider(value: $sliderValue, in: 0 ... 50, step: 5) {
                            Text("")
                        }
                        //.padding()
                    }
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: .infinity) // Set width to fill the available space.
                    //.background(RoundedRectangle(cornerRadius: 10).fill(Color(.darkGray)))
                    //.padding(.all, 10)
                    .listRowBackground(Color.darkGray)
                }
                .foregroundColor(.hlBlue)
            }
            .background(.hLoopIndigo)
            .scrollContentBackground(.hidden)
            
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
                    .background(Circle().fill(Color.hlBlue))
                }
                .padding(.horizontal, 10)
            }
            .padding(.top, 20)
        }
        .background(Color.hLoopIndigo)
    }
}

struct RecordView2_Previews: PreviewProvider {
    static var previews: some View {
        RecordView2()
    }
}
