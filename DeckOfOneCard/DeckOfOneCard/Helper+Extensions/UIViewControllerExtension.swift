//
//  UIViewControllerExtension.swift
//  DeckOfOneCard
//
//  Created by lijia xu on 8/3/21.
//

import UIKit

extension UIViewController {
    
    func presentErrorToUser(localizedError: LocalizedError) {
        let alertController = UIAlertController(title: "Error", message: localizedError.localizedDescription, preferredStyle: .actionSheet)
        
        let dismissAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        
        alertController.addAction(dismissAction)
        present(alertController, animated: true, completion: nil)
    }
    
}//End Of UIViewController Extension
