//
//  CardError.swift
//  DeckOfOneCard
//
//  Created by lijia xu on 8/3/21.
//

import Foundation

enum CardError: LocalizedError {
    case invalidURL
    case thrownError(Error)
    case noData
    case unableToDecode
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Internet Error, Please update software or contact support"
        case .thrownError(let error):
            return error.localizedDescription
        case .noData:
            return "server responded no data"
        case .unableToDecode:
            return "server responded bad data"
        }
        
    }//End Of errorDescription
    
}//End Of enum
