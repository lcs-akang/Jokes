//
//  Joke.swift
//  Jokes
//
//  Created by Aidan Kang on 2023-04-14.
//

import Blackbird
import Foundation

struct Joke: Identifiable, Codable, BlackbirdModel {
    @BlackbirdColumn let type: String
    @BlackbirdColumn let setup: String
    @BlackbirdColumn let punchline: String
    @BlackbirdColumn let id: Intç
}

let exampleJoke = Joke(type: "general",
                       setup: "How much does a hipster weigh?",
                       punchline: "An instagram.",
                       id: 146)
