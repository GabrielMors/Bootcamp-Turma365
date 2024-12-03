
import Foundation

protocol InformationProtocol {
    func printInformation() -> String
}

class Dog: InformationProtocol {
    var name: String
    var angry: Bool
    
    init(name: String, angry: Bool) {
        self.name = name
        self.angry = angry
    }
    
    func printInformation() -> String {
        let angryMessage: String = angry ? "Angry" : "Happy"
        return "\(name) is \(angryMessage)"
    }
}

class Cat: InformationProtocol {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func printInformation() -> String {
        return "cat's name is \(name)"
    }
}

class Logger {
        
    func printData() {
        
        let animals: [InformationProtocol] = [
            Dog(name: "Rex", angry: true),
            Dog(name: "Billy", angry: false),
            Dog(name: "Zeus", angry: true),
            Cat(name: "Thor"),
            Cat(name: "Odin"),
            Cat(name: "Shadow"),
        ]
        
        for animal in animals {
            print(animal.printInformation())
        }
    }
}
