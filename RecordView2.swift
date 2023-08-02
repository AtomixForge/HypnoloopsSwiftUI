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
                    .frame(width: 200, height:150, alignment: .center)
                    .padding(.horizontal, 10)
            }
            List {
                Section("Category of affirmation") {
                    HStack {
                        Text("Your affirmation will display here...")
                            .font(.subheadline)
                    }
                    //.listRowBackground(Color.hLoopIndigo)
                }
                
                Section("Name and save youer recording") {
                    HStack {
                        HStack {
                            Text("File Name")
                                .font(.subheadline)
                                //.padding(10)
                                //.foregroundColor(.white)
                                                
                            Spacer()
                        }
                        //.background(RoundedRectangle(cornerRadius: 10).fill(Color(.darkGray)))
                        //.padding(.leading, 10)
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
                                    .padding(.vertical, 10)
                                    .background(Color.blue)
                                    .cornerRadius(8)
                            }
                        }
                        //.padding(.trailing, 10)
                    }
                }
                
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
                    .frame(minWidth: 0, maxWidth: .infinity) // Set width to fill the available space.
                    //.background(RoundedRectangle(cornerRadius: 10).fill(Color(.darkGray)))
                    //.padding(.all, 10)
                       
                }
            }
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
            .padding(.top, 20)
        }
    }
}

struct RecordView2_Previews: PreviewProvider {
    static var previews: some View {
        RecordView2()
    }
}
