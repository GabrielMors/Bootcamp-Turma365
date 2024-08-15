//
//  main.swift
//  Funcões
//
//  Created by Gabriel Mors  on 8/7/24.
//

import Foundation


//MARK: Funções / Métodos


// "" aspas
// () parênteses
// {} Chave
// [] Colchetes


// Funcao sem parametro e sem retorno
func exibirNome() {
    print("Meu nome é Gabriel")
}

exibirNome() // Chamar funcao -> Dar vida a funcao

func abrirPorta() {
    print("Porta aberta")
}

func abrirJanela() {
    var janela = "Abrir janela"
    print(janela)
}

abrirJanela()

// Funcoes com parametro
func soma(valor1: Int, valor2: Int) {
    print(valor1 + valor2)
}

soma(valor1: 1, valor2: 12)

func exibirSoma() {
    soma(valor1: 10, valor2: 10)
    soma(valor1: 15, valor2: 145)
}

exibirSoma()


func nomeIdade(name: String, idade: Int) {
    print("Meu nome é \(name) e tenho \(idade) anos")
}

nomeIdade(name: "Nathalia", idade: 19)

func teste(idade: Int, idade2: Double) {
    print("Minha idade é \(idade + Int(idade2)) anos")
}

teste(idade: 15, idade2: 10)


// Funcoes com retorno

func meuNome() -> String {
    return "Gabriel"
}

meuNome()

// Funcoes com parametro e com retorno

func somaRetorno(valor1: Int, valor: Int) -> Int {
    var result = valor + valor1
    print(result)
    return result
}

var soma = somaRetorno(valor1: 1, valor: 1)


func idade(anoNascimento: Int, anoAtual: Int) -> Int {
    var minhaIdade = anoAtual - anoNascimento
    return minhaIdade
}

print(idade(anoNascimento: 1983, anoAtual: 2024))


func minhaIdade(idade: Int) -> String {
    return "Minha idade é \(idade)"
}

print(minhaIdade(idade: 1))


// Funcao sem retorno
func test(_ example: String) -> Void {
    
}

test("Gabriel")


//MARK: Exercicios
//1 - Criar função onde ela mostre na area de debug a frase: "Olá mundo, estou aprendendo a criar minhas primeiras funções".
//2 - criar funcao com nome soma que tenha 3 parametros (valor1: Int, valor2: Double, valor3: Int) e que ela faça uma soma entre os valores e retorno sobre valor total.
// 3 - crie uma funcao com um parametro e com o tipo de retorno diferente do parametro
func frase() {
    print("Olá mundo, estou aprendendo a criar minhas primeiras funções")
}

func somarValores(valor1: Int, valor2: Double, valor3: Int) -> Double {
    return Double(valor1) + valor2 + Double(valor3)
}

print(somarValores(valor1: 1, valor2: 1.22, valor3: 1))

func minhaIdade2(idade: Int) -> String {
    return "Minha idade é \(idade)"
}
