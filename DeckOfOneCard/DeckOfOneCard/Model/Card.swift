//
//  Card.swift
//  DeckOfOneCard
//
//  Created by lijia xu on 8/3/21.
//

import Foundation

struct TopLevelObject: Decodable {
    let cards: [Card]
}


struct Card: Codable {
    let value: String
    let suit: String
    let image: URL
}
