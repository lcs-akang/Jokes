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
    
    @Environment(\.blackbirdDatabase) var db: Blackbird.Database?
    
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
                .onDelete(perform: removeRows)
            }
            
            .navigationTitle("Favourite Jokes")
        }
    }
    
    // MARK: Functions
    func removeRows(at offsets: IndexSet) {
        
        Task {
            
            try await db!.transaction { core in
                
                var idList = ""
                for offset in offsets {
                    idList += "\(favouriteJokes.results[offset].id),"
                }
                
                print(idList)
                idList.removeLast()
                print(idList)
                
                try core.query("DELETE FROM Joke WHERE id IN (?)", idList)
                
            }
        }
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
            .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
}
