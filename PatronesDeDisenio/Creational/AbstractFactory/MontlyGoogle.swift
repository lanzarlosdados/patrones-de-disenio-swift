//
//  MontlyGoogle.swift
//  PatronesDeDisenio
//
//  Created by fabian zarate on 26/12/2025.
//

import Foundation

class MontlyGoogle: AbstractFactory {
    func createMethod() -> any Method {
        return MontlyMethod()
    }
    
    func createPayment() -> any Payment {
        return GooglePayment()
    }    
}
