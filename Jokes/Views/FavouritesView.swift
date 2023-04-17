//
//  FavouritesView.swift
//  Jokes
//
//  Created by Aidan Kang on 2023-04-17.
//

import Blackbird
import SwiftUI

struct FavouritesView: View {
    
    
    // MARK: Stored properties
    
    
    @BlackbirdLiveModels({ db in
        try await Joke.read(from: db)
    }) var favouriteJokes
    
    
    // MARK: Computed properties
    var body: some View {
        
        NavigationView {
            List {
                ForEach(favouriteJokes.results) { currentJoke in
                    VStack(alignment: .leading) {
                        Text(currentJoke.setup)
                            .bold()
                        Text(currentJoke.punchline)
                    }
                }
            }
            
            .navigationTitle("Favourite Jokes")
        }
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
            .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
}
