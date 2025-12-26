//
//  PaymentFactory.swift
//  PatronesDeDisenio
//
//  Created by fabian zarate on 26/12/2025.
//

import Foundation

class PaymentFactory {
    static func makePayment(type: TypePayment) -> Payment {
        switch type {
        case .card:
            return CardPayment()
        case .google:
            return GooglePayment()
        }
    }
}
