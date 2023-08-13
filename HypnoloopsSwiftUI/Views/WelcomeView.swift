//
//  WelcomeView.swift
//  HypnoloopsSwiftUI
//
//  Created by Olijujuan Green on 8/11/23.
//

import SwiftUI

struct WelcomeView: View {
    @State private var isRecording = false
    @State private var isPlaying = false
    @State private var recordedAffirmations: [String] = []

    var body: some View {

        let viewModel = WelcomeViewModel()

        NavigationView {
            VStack(spacing: 20) {
                Spacer()

                Image("loopLogo3")
                    .resizable()
                    .frame(width: 400, height: 150)
                    .aspectRatio(contentMode: .fit)

                if recordedAffirmations.isEmpty {
                    Text("Start recording your positive affirmations!")
                        .font(.headline)
                        .foregroundColor(.gray)
                } else {
                    VStack {
                        Text("Your Recorded Affirmations")
                            .font(.headline)
                            .padding(.bottom, 8)

                        List(recordedAffirmations, id: \.self) { affirmation in
                            Text(affirmation)
                        }
                    }
                }

                Spacer()

                VStack() {
                    ForEach(viewModel.navigationButtonTypes, id: \.self) { buttonType in
                        NavigationButton(type: buttonType)
                    }
                }

                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
