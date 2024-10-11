//
//  main.swift
//  Convenience-Init
//
//  Created by Gabriel Mors  on 10/11/24.
//

import Foundation

//No Swift, o convenience init (ou inicializador de conveniência) é uma forma de criar inicializadores adicionais para uma classe que chamam o inicializador designado da própria classe. O inicializador designado é o principal, enquanto os convenientes ajudam a adicionar mais formas de inicializar um objeto, mas sempre acabam chamando o inicializador principal.
//* Designated Initializer: O inicializador "designado" é o principal e tem a responsabilidade de garantir que todas as propriedades da classe sejam inicializadas.
//* Convenience Initializer: O inicializador "de conveniência" oferece opções extras para criar a classe, mas ele sempre precisa chamar, direta ou indiretamente, o inicializador designado.

class Pessoa {
    var name: String
    var age: Int?
    
    init(name: String, age: Int?) { // inicializado principal
        self.name = name
        self.age = age
    }
    
    convenience init(name: String) { // convenience init
        self.init(name: name, age: 18) // Valor default
    }
}

var pessoa1 = Pessoa(name: "Lais", age: 20) // Usando pelo inicializado principal
var pessoa2 = Pessoa(name: "Wagner") // Usando pelo convenience init
var pessoa3 = Pessoa(name: "Rodrigo", age: nil) // usando com opicional

