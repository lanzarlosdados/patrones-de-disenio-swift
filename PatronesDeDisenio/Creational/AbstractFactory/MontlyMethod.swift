//
//  MontlyMethod.swift
//  PatronesDeDisenio
//
//  Created by fabian zarate on 26/12/2025.
//

import Foundation

class MontlyMethod: Method {
    let amount: Double = 5.0
    
    func calculatePayment() -> [Double]? {
        print("Paying \(amount) montly")
        return [amount]
    }
}
