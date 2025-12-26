//
//  PaymentInAdvancedCard.swift
//  PatronesDeDisenio
//
//  Created by fabian zarate on 26/12/2025.
//

import Foundation

class PaymentInAdvancedCard: AbstractFactory {
    func createMethod() -> Method {
        return PaymentInAdvancedMethod()
    }
    
    func createPayment() -> Payment {
        return CardPayment()
    }
}
