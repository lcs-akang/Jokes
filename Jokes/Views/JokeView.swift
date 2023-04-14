//
//  JokeView.swift
//  Jokes
//
//  Created by Aidan Kang on 2023-04-14.
//

import SwiftUI

struct JokeView: View {
    
    // MARK: Stored properties
    
    @State var punchlineOpacity = 0.0
    
    @State var currentJoke = exampleJoke
    
    // MARK: Computed properties
    var body: some View {
        NavigationView {
            VStack {
                Text(currentJoke.setup)
                    .font(.title)
                    .multilineTextAlignment(.center)
                
                Button(action: {
                    withAnimation(.easeIn(duration: 1)) {
                        punchlineOpacity = 1.0
                    }
                }, label: {
                    Image(systemName: "arrow.down.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                        .tint(.black)
                })
                
                Text(currentJoke.punchline)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .opacity(punchlineOpacity)
            }
            .navigationTitle("Random Jokes")
        }
    }
}

struct JokeView_Previews: PreviewProvider {
    static var previews: some View {
        JokeView()
    }
}
