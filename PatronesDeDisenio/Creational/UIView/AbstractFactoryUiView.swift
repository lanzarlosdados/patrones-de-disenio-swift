//
//  AbstractFactoryUiView.swift
//  PatronesDeDisenio
//
//  Created by fabian zarate on 26/12/2025.
//

import SwiftUI

struct AbstractFactoryUiView: View {
    var body: some View {
        VStack {
            Button("Pay MontlyGoogle") {
                PaymentMethodClient.processPayment(factory: MontlyGoogle())
            }
            
            Button("Pay PaymentInAdvancedCard") {
                PaymentMethodClient.processPayment(factory: PaymentInAdvancedCard())
            }
        }
        .padding()
    }
    
}

#Preview {
    AbstractFactoryUiView()
}
