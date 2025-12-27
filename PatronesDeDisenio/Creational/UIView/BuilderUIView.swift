//
//  BuilderUIView.swift
//  PatronesDeDisenio
//
//  Created by fabian zarate on 27/12/2025.
//

import SwiftUI

struct CardBuilderView: View {
    @State private var name: String = ""
    @State private var number: String = ""
    @State private var expireDate: String = ""
    
    @State private var builtCard: Card? = nil
    @State private var infoText: String = ""
    
    var body: some View {
        VStack(spacing: 16) {
            // Inputs
            TextField("Nombre del titular", text: $name)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.words)
            
            TextField("Número de tarjeta", text: $number)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
            
            TextField("Fecha de expiración (MM/AA)", text: $expireDate)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numbersAndPunctuation)
            
            // Botón para construir la tarjeta
            Button("Build") {
                let card = Card.CardBuilder()
                    .setName(name)
                    .setNumber(number)
                    .setExpiryDate(expireDate)
                    .build()
                
                builtCard = card
                infoText = card.showInfo()
            }
            .buttonStyle(.borderedProminent)
            
            // Resultado
            if !infoText.isEmpty {
                Text(infoText)
                    .font(.headline)
                    .padding(.top, 8)
            } else {
                Text("Ingresa los datos y toca Build.")
                    .foregroundStyle(.secondary)
                    .padding(.top, 8)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Card Builder")
    }
}

#Preview {
    NavigationStack {
        CardBuilderView()
    }
}
