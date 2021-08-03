//
//  CardController.swift
//  DeckOfOneCard
//
//  Created by lijia xu on 8/3/21.
//

import UIKit


class CardController {
    static func fetchCard(completion: @escaping ( Result<Card, CardError> ) -> Void ) {
        let endPointString = "https://deckofcardsapi.com/api/deck/new/draw/?count=1"
        guard let url = URL(string: endPointString) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(.thrownError(error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let topLevelObject = try JSONDecoder().decode(TopLevelObject.self, from: data)
                
                guard let card = topLevelObject.cards.first else {
                    completion(.failure(.noData))
                    return
                }
                
                completion(.success(card))
                
            } catch {
                completion(.failure(.noData))
                return
            }
            
        }.resume()
    }//End Of fetchCard(completion:
    
    static func fetchImage(for card: Card, completion: @escaping ( Result<UIImage, CardError>) -> Void ) {
        
        URLSession.shared.dataTask(with: card.image) { data, _, error in
            if let error = error {
                completion(.failure(.thrownError(error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            guard let image = UIImage(data: data) else {
                completion(.failure(.unableToDecode))
                return
            }
            
            completion(.success(image))
            
        }.resume()
        
    }//End Of fetchImage(for card: Card, completion:
    
    
}//End Of Card Controller
