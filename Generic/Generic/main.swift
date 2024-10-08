//
//  main.swift
//  Generic
//
//  Created by Gabriel Mors  on 10/7/24.
//

import Foundation

class Sacola<T> {
    var conteudo: T
    
    init(conteudo: T) {
        self.conteudo = conteudo
    }
    
    func mostrarConteudo() {
        print("Conteudo: \(conteudo)")
    }
}

let sacolaDeLivros = Sacola(conteudo: "Codigo limpo")
sacolaDeLivros.mostrarConteudo()


// Sem Genéricos
func imprimirTexto(_ texto: String) {
    print("Texto: \(texto)")
}

func imprimirNumero(_ numero: Int) {
    print("Texto: \(numero)")
}


imprimirTexto("Gabriel")
imprimirNumero(1234)

// Com Genéricos
func imprimir<T>(_ item: T) {
    print("iTem: \(item)")
}

imprimir("Olá mundo")
imprimir(12345)
imprimir(true)


let listaDeFrutas: [String] = ["Banana", "Maça", "Uva"]
let listaDeNumeros: [Int] = [1, 2, 3, 4, 5]

func pegarPrimeiroItem<T>(lista: [T]) -> T? {
    lista.first
}

print(pegarPrimeiroItem(lista: listaDeFrutas) ?? "")
print(pegarPrimeiroItem(lista: listaDeNumeros) ?? 0)


func mostrarConteudoIfElse<T>(conteudo: T) {
    if let numero = conteudo as? Int {
        print("Isso é um numero inteiro: \(numero)")
    } else if let texto = conteudo as? String {
        print("Isso é um texto: \(texto)")
    } else if conteudo is Double {
        print("Isso é um numero decimal")
    } else {
        print("Outro tipo nao validade \(conteudo)")
    }
}

mostrarConteudoIfElse(conteudo: "Olá mundo")
mostrarConteudoIfElse(conteudo: 22)
mostrarConteudoIfElse(conteudo: 1.80)


func mostrarConteudoSwitchCase<T>(conteudo: T) {
    switch conteudo {
    case let numero as Int:
        print("Isso é um numero inteiro: \(numero)")
    case let texto as String:
        print("Isso é um texto: \(texto)")
    case let decimal as Double:
        print("Isso é um numero decimal: \(decimal)")
    default :
        print("Outro tipo nao validade \(conteudo)")
    }
}


//1. Função Genérica Básica
//Crie uma função genérica chamada printValue que simplesmente imprime qualquer valor que for passado como argumento.
//
//Objetivo: Introduzir o conceito de genéricos, mostrando como uma função pode aceitar qualquer tipo de dado sem especificar o tipo.

//2. Função Genérica para Duplicar Valores
//Crie uma função genérica chamada duplicateValue que recebe um valor e retorna um array com esse valor duplicado.
//
//Objetivo: Demonstrar como os genéricos podem ser usados em funções que manipulam diferentes tipos de dados.


//3. Array Genérico
//Crie uma função genérica chamada createArray que receba um valor e uma quantidade, e retorne um array com o valor repetido a quantidade de vezes especificada.
//
//Objetivo: Entender como genéricos podem ser aplicados a funções que criam estruturas de dados.
