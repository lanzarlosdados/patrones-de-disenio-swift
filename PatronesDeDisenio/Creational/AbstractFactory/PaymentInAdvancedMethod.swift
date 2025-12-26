//
//  PaymentInAdvancedMethod.swift
//  PatronesDeDisenio
//
//  Created by fabian zarate on 26/12/2025.
//

import Foundation

class PaymentInAdvancedMethod: Method {
    let amount: Double = 10.0
    
    func calculatePayment() -> [Double]? {
        print("Paying \(amount) in advance")
        return [amount]
    }
}
