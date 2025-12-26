//
//  PaymentMethodClient.swift
//  PatronesDeDisenio
//
//  Created by fabian zarate on 26/12/2025.
//

import Foundation

class PaymentMethodClient {
    static func processPayment(factory: AbstractFactory) {
        let factory = factory
        let method = factory.createMethod()
        let payment = factory.createPayment()
        print("Processing payment of \(method.calculatePayment()) using \(payment.doPayment)")
    }
}
