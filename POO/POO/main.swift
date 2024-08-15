//
//  main.swift
//  POO
//
//  Created by Gabriel Mors  on 8/14/24.
//

import Foundation

//MARK: Classe

class Casa {
    
    var porta: Bool = true
    var metrosQuadrados: Double = 350.0
    var condominio: Bool = false
    
    
    func abrirJanela() {
        print("abriu a janela")
    }
    
    func luzesAcessa() -> Bool {
        return true
    }
}

var minhaCasa: Casa = Casa()
var casaNathalia: Casa = Casa()


class Humano {
    
    var nome: String = "Gabriel"
    var peso: Int = 72
    var altura: Double = 1.76
    
    func andar() {
        print("Esta andando")
    }
}

var gabriel = Humano()
var nathalia = Humano()


class Carro {
    var marca: String = "lamborguini"
    var cor: String = "Red"
    var modelo: String = "SVJ"
    var ano: Int = 2020
    var farolAcesso: Bool = false
    
    func getMarca() -> String {
        return self.marca
    }
    
}


var meuCarro: Carro = Carro()
//print(meuCarro.farolAcesso)


meuCarro.farolAcesso = true
//print(meuCarro.farolAcesso)


meuCarro.cor = "Blue"
//print(meuCarro.cor)


//MARK: Classe com mentodos construtores


class Pessoa {
    
    var nome: String
    var peso: Int
    var altura: Double
    var profissao: String
    
    init(nome: String, peso: Int, altura: Double, profissao: String) {
        self.nome = nome
        self.peso = peso
        self.altura = altura
        self.profissao = profissao
    }
    
    func andar() {
        print("Esta andando")
    }
}

var lais = Pessoa(nome: "Lais", peso: 1, altura: 1.67, profissao: "QA")
var edu = Pessoa(nome: "Edu", peso: 1, altura: 1.67, profissao: "Programador")



//MARK: HERANÇA

class Animal {

    public func correr()-> String {
        return "o cavalo esta correndo"
    }
    
    func andar()-> String {
        return "o cavalo esta andando"
    }
    
    func gestoAnimal() {
        
    }
}

var animal: Animal = Animal()
animal.correr()


// Poliforfismo
// Encapsulamento
class Cavalo: Animal {
    
    internal var peso: Double
    private var anos: Int
    private var raca: String

    
    init(peso: Double, anos: Int, raca: String) {
        self.peso = peso
        self.anos = anos
        self.raca = raca
    }
    
    override func correr() -> String {
        return "lsdafjosakdjjf"
    }
    
    override func gestoAnimal() -> Void {
        
    }
    
    
    public func getRaca() -> String {
        return raca
    }
}

var cavalo: Cavalo = Cavalo(peso: 1000.0, anos: 6, raca: "qualque uma")
print(cavalo.correr())




//MARK: REFERENCIA

class Mac {
    var modelo: String
    var ano: Int
    
    init(modelo: String, ano: Int) {
        self.modelo = modelo
        self.ano = ano
    }
}

var meuMac: Mac = Mac(modelo: "Macbook Pro m3", ano: 2023)
var sisterMac: Mac = Mac(modelo: "Macbook Air m2", ano: 2022)

print(sisterMac.modelo)
print(meuMac.modelo)


meuMac = sisterMac
print(meuMac.modelo)

sisterMac.modelo = "Macbook PRO 2017"
print(sisterMac.modelo)
print(meuMac.modelo)

print(meuMac.ano)
meuMac.ano = 2030
print(meuMac.ano)
print(sisterMac.ano)


// MARK: Struct

struct Sobrado {
    
    var quantidadeDePortas: Int
    var quantidadeDeBanheiros: Int
    var emConstrucao: Bool

}

var casaGabriel: Sobrado = Sobrado(quantidadeDePortas: 15, quantidadeDeBanheiros: 4, emConstrucao: true)
var casaRodrigo: Sobrado = Sobrado(quantidadeDePortas: 20, quantidadeDeBanheiros: 8, emConstrucao: false)

casaGabriel = casaRodrigo
print(casaGabriel.emConstrucao) // false
print(casaRodrigo.emConstrucao) // false
print(casaRodrigo.quantidadeDeBanheiros) // 8

print("=========================")

casaRodrigo.quantidadeDeBanheiros = 10

print(casaGabriel.quantidadeDeBanheiros) // 8
print(casaRodrigo.quantidadeDeBanheiros) // 10

print(casaGabriel.quantidadeDePortas)
print(casaRodrigo.quantidadeDePortas)





