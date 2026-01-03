import Foundation

// MARK: - 1. Abstracciones (Protocolos)
// Definimos los productos por su comportamiento, no por su clase base.

protocol ButtonView {
    func render()
}

protocol TextFieldView {
    func render()
}

// Abstract Factory
// Define la familia de productos que deben funcionar juntos.
protocol UIFactory {
    func createButton(title: String) -> ButtonView
    func createTextField(placeholder: String) -> TextFieldView
}

// MARK: - 2. Implementaciones Concretas (Privadas)
// Ocultamos los detalles. El cliente nunca debería instanciar 'IOSButton' directamente.

// --- Familia iOS ---
private struct IOSButton: ButtonView {
    let title: String
    func render() {
        print("📱 iOS Button: [ \(title) ] (Blue, Rounded)")
    }
}

private struct IOSTextField: TextFieldView {
    let placeholder: String
    func render() {
        print("📱 iOS TextField: \(placeholder) (Virtual Keyboard)")
    }
}

class IOSFactory: UIFactory {
    func createButton(title: String) -> ButtonView {
        return IOSButton(title: title)
    }
    
    func createTextField(placeholder: String) -> TextFieldView {
        return IOSTextField(placeholder: placeholder)
    }
}

// --- Familia macOS ---
private struct MacOSButton: ButtonView {
    let title: String
    func render() {
        print("�️ macOS Button: [ \(title) ] (Gray, Square)")
    }
}

private struct MacOSTextField: TextFieldView {
    let placeholder: String
    func render() {
        print("�️ macOS TextField: \(placeholder) (Physical Keyboard)")
    }
}

class MacOSFactory: UIFactory {
    func createButton(title: String) -> ButtonView {
        return MacOSButton(title: title)
    }
    
    func createTextField(placeholder: String) -> TextFieldView {
        return MacOSTextField(placeholder: placeholder)
    }
}

// MARK: - 3. Cliente (Desacoplado)
// RESPONDIENDO TU PREGUNTA:
// Sí, el 'Client' es quien llama a los métodos creacionales (factory.createButton).
// Su responsabilidad es pedir "Piezas de UI" para armar la pantalla, pero NO sabe
// si esas piezas son de iOS o macOS. Esa es la magia.

class LoginForm {
    private let factory: UIFactory
    
    // Inyección de Dependencia: El factory se recibe desde fuera.
    init(factory: UIFactory) {
        self.factory = factory
    }
    
    func render() {
        // El cliente pide productos abstractos
        let usernameField = factory.createTextField(placeholder: "Usuario")
        let passwordField = factory.createTextField(placeholder: "Contraseña")
        let loginButton = factory.createButton(title: "Entrar")
        
        print("\n--- Renderizando Login Form ---")
        usernameField.render()
        passwordField.render()
        loginButton.render()
        print("-------------------------------\n")
    }
}

// MARK: - 4. Configuración (Composition Root)
// Aquí es donde se decide qué fábrica usar. Esto ocurre al inicio de la app.

let env = "iOS" // Simulación de variable de entorno

let factory: UIFactory
if env == "iOS" {
    factory = IOSFactory()
} else {
    factory = MacOSFactory()
}

// El cliente (LoginForm) funciona igual con cualquiera de las dos fábricas
let loginScreen = LoginForm(factory: factory)
loginScreen.render()
