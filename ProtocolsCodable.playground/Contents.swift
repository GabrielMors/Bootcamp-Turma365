import UIKit


// MARK: Decodable
// Descodificar-lo, ou seja, tornar um tipo JSON para um Objeto Swift

// MARK: Encodable
// Codificá-lo, ou seja, tornar um tipo de dado no Swift em JSON

// MARK: Codable
// Condifica como também decodifica

struct Person: Encodable, Decodable {
    var name: String?
    var age: Int?
    var lastName: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name_app"
        case age = "age_app"
        case lastName = "last_name"
    }
}

// CODIFICAÇÃO -> (Encoding)
let person = Person(name: "Gabriel", age: 19, lastName: "Mors")
let jsonEncoder = JSONEncoder()
jsonEncoder.outputFormatting = .prettyPrinted

do {
    let jsonData = try jsonEncoder.encode(person) // Transformando nosso objeto em um dado (Binário -> 010001010101001010010101)
    if let jsonString = String(data: jsonData, encoding: .utf8) {
        print("JSON CODIFICADO")
        print(jsonString)
    }
} catch {
    print("Erro ao codificar em JSON \(error)")
}

// DECODIFICAÇÃO -> (Decoding)
let jsonString = """
{ //Snake case - Nomeclatura
    "name_app": "Gabriel",
    "age_app": 19,
    "last_name": "Mors"
}
"""

let jsonDecoder = JSONDecoder()

if let jsonData = jsonString.data(using: .utf8) {
    
    do {
        let decodePerson: Person = try jsonDecoder.decode(Person.self, from: jsonData)
        print("DECODIFICADO:")
        print("name: \(decodePerson.name ?? "")\nage: \(decodePerson.age ?? 0)\nlastName: \(decodePerson.lastName ?? "")")
    } catch {
        print("Erro ao decodificar em JSON \(error)")
    }
}
