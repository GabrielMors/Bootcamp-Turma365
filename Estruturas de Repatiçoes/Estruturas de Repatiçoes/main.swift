//
//  main.swift
//  Estruturas de Repatiçoes
//
//  Created by Gabriel Mors  on 8/5/24.
//

import Foundation

// MARK: Estruturas de repeticao

// O while é uma estrutura de repeticao que fica repetindo ENQUANTO a condicao for verdadeira

// While
var idade: Int = 1

while idade < 18 {
    print("Voce é menor de idade, pois voce tem \(idade) anos")
    idade += 1
}
print("Voce é maior de idade, pois voce tem \(idade) anos")


// Repeat
//O repeat é uma estrutura de repeticao que executa primeiramente, e no fim ele questiona se deve repetir ou nao

var indexRepeat: Int = 1

repeat {
    print("Index \(indexRepeat)")
    indexRepeat = indexRepeat + 1
} while indexRepeat <= 3

print("Index final \(indexRepeat)")


// For In
// O FOR é uma estrutura de repetição que trabalha com sequencia (uma lista de itens) que ela percorre item a item desta lista e conseguindo capturar o valor de cada um deles
// Antes do in você pode colocar o nome que você quiser
// Oque vem antes do in é o valor da posição da lista


for numeroExemplo in 0...10 {
    print("numero \(numeroExemplo)")
}



// Coleçoes

// MARK: Array
// Array -> Lista
// Index -> Posiçao de um elemento da lista
// Array trabalha de forma ORDENADA -> Suas posiçoes nao sao alteradas

//                                0         1         2        3         4        5          6
var diasDaSemana: [String] = ["Segunda", "terça", "Quarta", "Quinta", "Sexta", "sabado", "domingo"]

print(diasDaSemana)
diasDaSemana.remove(at: 3)
print(diasDaSemana)
diasDaSemana.append("Quinta")
print(diasDaSemana)
diasDaSemana.insert("quinta", at: 3)
diasDaSemana.removeAll()

var numerosExemplo: [Int] = [1,2,3,4,5,6,7,8,9,10]
print(numerosExemplo.count)
print(numerosExemplo.isEmpty)
numerosExemplo.append(11)
print(numerosExemplo)


// MARK: Dicionáriuo

//É uma Lista
// NAO TRABALHA DE FORMA ORDENADA
// Trabalha com chave e valor

var produtos: [Int: String] = [1: "Salgado", 2: "Sabao",3: "Refrigerante",4: "Sabato",5: "Salgado",]

var buscarProdutos: String = produtos[3] ?? ""
print(buscarProdutos)

produtos.removeValue(forKey: 1)
print(produtos)

produtos.updateValue("qualquer coisa", forKey: 2)
print(produtos)

