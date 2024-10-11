//
//  main.swift
//  RevisandoPOO
//
//  Created by Gabriel Mors  on 8/21/24.
//

import Foundation

//MARK: Classe
// TRABALHA COM REFERENCIA!!!!! REFENCE TYPE
// Herança
// Atributos/Propriedades = caracteriusticas de um objeto
// Funcoes/metodos = Acoes
// INIT

class Pessoa {
    
    var nome: String
    var idade: Int
    var temCabelo: Bool = true
    var esmalte: Bool?
    
    //MARK: Construtores
    // Os construtores tem a finalidade de indicar o que sua classe necessita de um valor incial para seus atributos.
    // Caso o seu atributo nao tenha um valor incial, vc será obrigatorio passar atraves do INIT (Construtor)
    init(nome: String, idade: Int, temCabelo: Bool, esmalte: Bool? = nil) {
        self.nome = nome
        self.idade = idade
        self.temCabelo = temCabelo
        self.esmalte = esmalte
    }
    
    func correr() {
        print("O \(nome) sta correndo")
    }
    
    func eCareca() {
        print("O \(nome) tem cabelo: \(temCabelo)")
    }
}

// A partir do momento que vc instancia a CLASSE se torna um OBJETO
var rodrigo: Pessoa = Pessoa(nome: "Rodrigo", idade: 39, temCabelo: true) // Objeto Rodrigo
var sthashy: Pessoa = Pessoa(nome: "sthashy", idade: 27, temCabelo: true, esmalte: true) // Objeto Sthashy


rodrigo.eCareca()
sthashy.eCareca()

print(rodrigo.esmalte ?? false)
print(sthashy.esmalte ?? false)

rodrigo = sthashy

print(rodrigo.nome)
print(rodrigo.idade)

sthashy.idade = 20

print(rodrigo.idade)// 20
print(sthashy.idade)// 20


//MARK: Herança

// Classe PAI
class Animal {
    
    var nome: String
    var cor: String
    var peso: Double
    
    init(nome: String, cor: String, peso: Double) {
        self.nome = nome
        self.cor = cor
        self.peso = peso
    }
    
    func brincar() {
        print("O cachorro \(nome) esta brincando")
    }
    
}


// Classe FILHA
//MARK: Poliomorfismo

class Cachorro: Animal {
    
    var idade: Int
    var latir: Bool
    
    init(idade: Int, latir: Bool, nome: String, cor: String, peso: Double) {
        self.idade = idade
        self.latir = latir
        super.init(nome: nome, cor: cor, peso: peso)
    }
    
// Reescrevendo a funcao da classe PAI
    override func brincar() {
        print("O dono esta brincado")
    }
    
}

var rex: Cachorro = Cachorro(idade: 1, latir: true, nome: "Rex", cor: "Branco", peso: 30.0)
rex.brincar()

//MARK: Encapsulamento

class ItemDeMercado {
    
    private var listaDeItens: [String] = []
    
    public func getListOfItems() -> [String] {
        return listaDeItens
    }
    
    public func setListOfItens(item: String) {
        listaDeItens.append(item)
    }
}

var mercado: ItemDeMercado = ItemDeMercado()
mercado.setListOfItens(item: "Maça")
print(mercado.getListOfItems())


// ------------------------------------------------

//MARK: Struct
// Struct trabalha com VALUE Type
// Nao trabalha com referencia
// Struct nao precisa do INIT(construtor) de forma explicita
// Struct nao trabalha com Orientacao a Objeto
// Nao trabalha com Herança
// So aceita estar em conformidade com PROTOCOLO

struct Celular {
    var modelo: String
    
    init(modelo: String) {
        self.modelo = modelo
    }
}

var iphone: Celular = Celular(modelo: "iPhone 15 Pro")
var android: Celular = Celular(modelo: "Xiome")

print(iphone.modelo) //iPhone 15 Pro
print(android.modelo) //Xiome

print("--------------")

iphone = android

print(iphone.modelo) //Xiome
print(android.modelo) //Xiome

print("--------------")

iphone.modelo = "iphone SE"
print(iphone.modelo) // iphone SE
print(android.modelo) // Xiome
