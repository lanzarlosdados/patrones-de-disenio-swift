//
//  AbstractFactory.swift
//  PatronesDeDisenio
//
//  Created by fabian zarate on 26/12/2025.
//

import Foundation

protocol AbstractFactory {
    func createMethod() -> Method
    func createPayment() -> Payment
}
