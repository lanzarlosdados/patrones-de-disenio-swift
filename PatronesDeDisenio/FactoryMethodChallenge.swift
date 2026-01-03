import Foundation

// MARK: - 1. El Escenario "Sucio" (Dirty Code)
/*
 El problema original era una clase 'NotificationSender' con un switch gigante.
 Cada nuevo tipo de notificación requerí modificar la clase, rompiendo el Open/Closed Principle.
 
 enum NotificationType {
    case email, sms, push
 }
 
 class NotificationSender {
    func send(...) { switch type ... } // Malo: Alto acoplamiento.
 }
 */

// MARK: - 2. Solución "Swifty" Ideal: Factory Method

// A. Abstracción (Protocolo)
// Define QUÉ hace un notificador, sin exponer CÓMO.
protocol NotificationSender {
    func send(message: String)
}

// B. Implementaciones Concretas
// Usamos 'private' o 'internal' para encapsular la lógica.
// El cliente NO necesita saber que existen estas structs.
private struct EmailSender: NotificationSender {
    func send(message: String) {
        print("� Enviando Email: \(message) [SMTP Configurado]")
    }
}

private struct SMSSender: NotificationSender {
    func send(message: String) {
        print("� Enviando SMS: \(message) [Twilio API]")
    }
}

private struct PushSender: NotificationSender {
    func send(message: String) {
        print("🔔 Enviando Push: \(message) [APNS Verificado]")
    }
}

// C. El Factory (Creator)
// En Swift, un enum sin casos es ideal para namespaces estáticos.
enum NotificationFactory {
    
    enum NotificationType {
        case email
        case sms
        case push
    }
    
    // El "Factory Method" Estático
    // Centraliza la lógica de creación (el switch va aquí).
    static func make(for type: NotificationType) -> NotificationSender {
        switch type {
        case .email:
            return EmailSender()
        case .sms:
            return SMSSender()
        case .push:
            return PushSender()
        }
    }
}

// MARK: - 3. Uso del Cliente
// El cliente solo conoce 'NotificationFactory' y el protocolo 'NotificationSender'.
// No conoce las clases concretas (EmailSender, etc.), lo que reduce el acoplamiento.

func main() {
    print("--- Cliente Solicitando Notificaciones ---\n")
    
    let emailNotifier = NotificationFactory.make(for: .email)
    emailNotifier.send(message: "Bienvenido a la App")
    
    let smsNotifier = NotificationFactory.make(for: .sms)
    smsNotifier.send(message: "Tu código es 5544")
    
    let pushNotifier = NotificationFactory.make(for: .push)
    pushNotifier.send(message: "Tu pedido está en camino")
}

// Ejecutamos la demo
main()

/*
 MARK: - Explicación de la Refactorización
 
 1. Encapsulamiento (Private types):
    Las structs `EmailSender`, `SMSSender`, etc., son privadas. Esto previene que el código cliente
    las instancie directamente, forzando el uso del Factory.
 
 2. Factory Estático (Enum Factory):
    Usamos `NotificationFactory.make(for:)` como el punto único de creación.
    Si mañana agregamos `WhatsApp`, solo tocamos el archivo del Factory, no el código cliente.
 
 3. Protocol Oriented:
    El método retorna `NotificationSender` (el protocolo), no una clase base.
    Esto permite que structs, clases o incluso enums puedan ser "Notificadores" en el futuro.
 */
