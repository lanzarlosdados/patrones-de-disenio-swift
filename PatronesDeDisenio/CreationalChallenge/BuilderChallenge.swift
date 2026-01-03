import Foundation

// MARK: - Código Sucio / Dirty Code
// ESCENARIO: Módulo de Networking.
// PROBLEMA: "Telescoping Constructor" (Antipatrón).
// Para crear una petición HTTP compleja, el cliente debe lidiar con un inicializador gigante,
// pasando muchos parámetros 'nil' o valores por defecto que no le interesan.

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
}

class HTTPRequest {
    let url: String
    let method: HTTPMethod
    let headers: [String: String]?
    let body: Data?
    let timeout: TimeInterval
    let cachePolicy: URLRequest.CachePolicy
    
    // Inicializador monstruoso
    init(url: String, 
         method: HTTPMethod = .get, 
         headers: [String: String]? = nil, 
         body: Data? = nil, 
         timeout: TimeInterval = 60.0, 
         cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) {
        
        self.url = url
        self.method = method
        self.headers = headers
        self.body = body
        self.timeout = timeout
        self.cachePolicy = cachePolicy
    }
    
    func execute() {
        print("🚀 Enviando \(method.rawValue) a \(url)")
        if let headers = headers { print("   Headers: \(headers)") }
        if let body = body { print("   Body: \(body.count) bytes") }
        print("   Timeout: \(timeout)s | Cache: \(cachePolicy.rawValue)")
    }
}

// Uso del cliente
// El cliente solo quiere hacer un POST con un body, pero se ve obligado a pensar en headers, timeout, etc.
// O si no usa valores por defecto, la llamada se vuelve ilegible.

// Caso 1: Petición Simple (OK)
let simpleRequest = HTTPRequest(url: "https://api.myapp.com/users")
simpleRequest.execute()

// Caso 2: Petición Compleja (Feo y propenso a errores humanos)
let bodyData = "{\"user\":\"fabian\"}".data(using: .utf8)
let complexRequest = HTTPRequest(url: "https://api.myapp.com/login",
                                 method: .post,
                                 headers: ["Content-Type": "application/json"],
                                 body: bodyData,
                                 timeout: 30, // Tengo que acordarme qué parámetro era este
                                 cachePolicy: .reloadIgnoringLocalCacheData) // Y este...
complexRequest.execute()
