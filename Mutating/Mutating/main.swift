//
//  main.swift
//  Mutating
//
//  Created by Gabriel Mors  on 10/11/24.
//

import Foundation

//Em Swift, as structs e enums são tipos de valor, o que significa que, quando você os modifica, na verdade está trabalhando com uma cópia deles, não com o valor original. Isso é diferente das classes, que são tipos de referência. Por padrão, as funções dentro de uma struct ou enum não podem alterar as propriedades do próprio objeto.

//Para modificar as propriedades dentro de uma função de uma struct ou enum, você precisa marcar a função como mutating. Isso indica que a função pode alterar os dados da própria instância.

struct Contador {
    var valor: Int = 0
    
    mutating func incrementar() {
        valor += 1
    }
}

var contador = Contador()
contador.incrementar()


enum Direcao {
    case norte, sul, leste, oeste
    
    mutating func proximaDirecao() {
        switch self {
        case .norte:
            self = .leste
        case .leste:
            self = .sul
        case .sul:
            self = .oeste
        case .oeste:
            self = .norte
        }
    }
    
}

var direcaoAtual = Direcao.norte
print(direcaoAtual) // norte

direcaoAtual.proximaDirecao()
print(direcaoAtual) // leste


