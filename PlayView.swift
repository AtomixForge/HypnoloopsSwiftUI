//
//  PlayView.swift
//  hypnoLoops
//
//  Created by Joey Rubin on 8/1/23.
//

import SwiftUI

struct PlayView: View {
  
    @State private var activeSheet: ActiveSheet?
    @State private var settingsDetent = PresentationDetent.medium
    
    enum ActiveSheet: Identifiable {
        case settings, soundScape, recordings

        var id: Int {
            hashValue
        }
    }

    
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
                Section("Chose Recording and music") {
                    
                    HStack {
                        Button(action: {
                            self.activeSheet = .recordings
                            print("Recordings pressed!")
                        }) {
                            HStack {
                                Text("Recordings")
                                Image(systemName: "record.circle")
                            }
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 10)
                            .background(Color.blue)
                            .cornerRadius(8)
                        }
                        .buttonStyle(.plain)
                        
                        Text("Your recording file here")
                            .font(.subheadline)
                        
                    }
                    //.listRowBackground(Color.hLoopIndigo)
                    
                    
                    HStack {
                        Button(action: {
                            self.activeSheet = .soundScape
                            print("Sound Scape pressed!")
                        }) {
                            HStack {
                                Text("Sound Scape")
                                Image(systemName: "chevron.right")
                            }
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 10)
                            .background(Color.blue)
                            .cornerRadius(8)
                        }
                        .buttonStyle(.plain)
                        
                        Text("Sound Bowls")
                            .font(.subheadline)
                    }
                    
                }
                
                Section("Playback controls") {
                 HStack {
                     
                    Button(action: {
                        self.activeSheet = .settings
                        print("Settings pressed!")
                    }) {
                        Image(systemName: "slider.horizontal.3")
                    }
                    .font(.title)
                    .padding(.horizontal, 5)
                    .padding(.vertical, 5)
                    
                    Spacer()
                     
                     Text("7:21") //Need binding for time
                     Text("/")
                     Text("21:00")
                     
                     Spacer()
                     
                     
                     
                     Button(action: {
                         
                         print("Repeat pressed!")
                     }) {
                         Image(systemName: "repeat")
                     }
                     .font(.title)
                     .padding(.horizontal, 5)
                     .padding(.vertical, 5)
                     
                 }

                }
                
            }
            
            .listRowInsets(EdgeInsets())
            //.background(.darkGray)
            //.scrollContentBackground(.hidden)
            
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
            
        }
        //.background(Color.hLoopIndigo)
        .sheet(item: $activeSheet) { item in
            switch item {
            case .settings:
                PlaySettingsView()
                    .presentationDetents(
                        [.medium, .large],
                        selection: $settingsDetent
                    )
            case .soundScape:
                SoundScapeView()
                    .presentationDetents(
                        [.medium, .large],
                        selection: $settingsDetent
                    )
            case .recordings:
                SavedRecordingsView()
                    .presentationDetents(
                        [.medium, .large],
                        selection: $settingsDetent
                    )
            }
        }
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView()
    }
}
