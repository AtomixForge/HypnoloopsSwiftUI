//
//  SavedRecordingsView.swift
//  hypnoLoops
//
//  Created by Joey Rubin on 8/1/23.
//

import SwiftUI

struct SavedRecordingsView: View {
    
    let testArray = ["Test 1", "Test 2", "Test 3"]
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button(action: {
                        // insert your action here
                        print("Delete!")
                    }) {
                        HStack {
                            Text("Delete")
                            Image(systemName: "trash")
                        }
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 10)
                        .background(Color.red)
                        .cornerRadius(8)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        // insert your action here
                        print("Selected!")
                    }) {
                        HStack {
                            Text("Select")
                            Image(systemName: "chevron.right")
                        }
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 10)
                        .background(Color.blue)
                        .cornerRadius(8)
                    }
                }
                .padding()
                
                List {
                    Section("All Recordings:") {
                        ForEach(testArray, id: \.self) { test in
                            Text("\(test)")
                        }
                    }
                    
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle("Saved Recordings")
    }
}

struct SavedRecordingsView_Previews: PreviewProvider {
    static var previews: some View {
        SavedRecordingsView()
    }
}
