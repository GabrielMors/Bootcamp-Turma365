//MARK: The Open-Closed Principle (OCP) (Princípio Aberto-Fechado)

// Você deve ser capaz de estender um comportamento de uma classe, sem modificá-la


import Foundation

class Dog {
    var name: String
    var angry: Bool
    
    init(name: String, angry: Bool) {
        self.name = name
        self.angry = angry
    }
    
    func printInfo() -> String {
        let angryMessage: String = angry ? "Angry" : "Happy"
        return "\(name) is \(angryMessage)"
    }
}

class Cat {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func printInfo() -> String {
        return "cat's name is \(name)"
    }
}

class Logger {
    
    func printData() {
        
        let dogs: [Dog] = [
            Dog(name: "Rex", angry: true),
            Dog(name: "Billy", angry: false),
            Dog(name: "Zeus", angry: true),
        ]
        
        for dog in dogs {
            dog.printInfo()
        }
        
        let cats: [Cat] = [
            Cat(name: "Thor"),
            Cat(name: "Odin"),
            Cat(name: "Shadow"),
        ]
        
        for cat in  cats {
            cat.printInfo()
        }
        
    }
}

// MARK: Qual o problema do código acima?

// Toda vez que houver a necessidade de adicionar uma nova classe com a funcao printInfo, vamos precisar alterar a classe Logger e isso QUEBRA o príncipio de Aberto e Fechado.


