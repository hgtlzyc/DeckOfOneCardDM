//
//  CardViewController.swift
//  DeckOfOneCard
//
//  Created by lijia xu on 8/3/21.
//

import UIKit

class CardViewController: UIViewController {

    @IBOutlet weak var cardNameLabel: UILabel!
    @IBOutlet weak var cardImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func fetchImageAndUpdateViews(for card: Card) {
        
        CardController.fetchImage(for: card) { [weak self] result in
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    self?.cardNameLabel.text = "\(card.value) of \(card.suit)"
                    self?.cardImage.image = image
                }
                
            case .failure(let err):
                self?.presentErrorToUser(localizedError: err)
            }
            
        }
        
    }//End Of func
    
    @IBAction func drawButtonTapped(_ sender: Any) {
        
        CardController.fetchCard { [weak self] result in
            switch result {
            case .success(let card):
                self?.fetchImageAndUpdateViews(for: card)
            case .failure(let err):
                self?.presentErrorToUser(localizedError: err)
            }
            
        }
        
    }//End Of func
    
}//End Of CardViewController
