//
//  AuthenticationViewModel.swift
//  HypnoloopsSwiftUI
//
//  Created by Olijujuan Green on 7/30/23.
//

import Foundation

final class AuthenticationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func createAccountTapped() {
        // Handle create account action here
        print("hi")
    }
    
    func loginButtonTapped() {
        var counter = 5
        
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if counter > 0 {
                print(counter)
                counter -= 1
            } else {
                timer.invalidate()
                print("Countdown completed!")
            }
        }
        
        // Run the timer on the current run loop to start the countdown
        RunLoop.current.add(timer, forMode: .common)
    }
}
