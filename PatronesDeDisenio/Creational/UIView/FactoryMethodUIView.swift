//
//  SwiftUIView.swift
//  PatronesDeDisenio
//
//  Created by fabian zarate on 26/12/2025.
//

import SwiftUI

struct FactoryMethodUIView: View {
    var body: some View {
        VStack {
            Button("Pay Google") {
                let payment = PaymentFactory.makePayment(type: .google)
                payment.doPayment()
            }
            
            Button("Pay Card") {
                let payment = PaymentFactory.makePayment(type: .card)
                payment.doPayment()
            }

        }
        .padding()
    }
}

#Preview {
    FactoryMethodUIView()
}
