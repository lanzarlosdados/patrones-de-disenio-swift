//
//  Card.swift
//  PatronesDeDisenio
//
//  Created by fabian zarate on 27/12/2025.
//

import Foundation

class Card {
    private var name: String = ""
    private var number: String = ""
    private var expireDate: String = ""
    
    func showInfo() -> String {
        return "Name: \(name), Number: \(number), Expire Date: \(expireDate)"
    }
    
    class CardBuilder {
        private var card: Card
        
        init() {
            self.card = Card()
        }
        
        func setName(_ name: String) -> CardBuilder {
            card.name = name
            return self
        }
        
        func setNumber(_ number: String) -> CardBuilder {
            card.number = number
            return self
        }
        
        func setExpiryDate(_ expireDate: String) -> CardBuilder {
            card.expireDate = expireDate
            return self
        }
        
        func build() -> Card {
            return card
        }
    }
}
