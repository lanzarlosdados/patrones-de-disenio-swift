//
//  PatronesDeDisenioApp.swift
//  PatronesDeDisenio
//
//  Created by fabian zarate on 26/12/2025.
//

import SwiftUI

@main
struct PatronesDeDisenioApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                CardBuilderView()
            }
        }
    }
}

protocol Observer: AnyObject {
    func update()
}

class Subject {
    var observers: [Observer] = []
    
    func addObserver(_ observer: Observer) {
        observers.append(observer)
    }
    
    func unregisterObserver(_ observer: Observer) {
        observers.removeAll { $0 === observer }
    }
    
    func notifyObservers() {
        observers.forEach { $0.update() }
    }
}

class PersonObserver: Observer {
    func update() {
        print("Person updated")
    }
}

class CarObserver: Observer {
    func update() {
        print("Car updated")
    }
}
