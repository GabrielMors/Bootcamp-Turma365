//
//  main.swift
//  Estrutura Condicional
//
//  Created by Gabriel Mors  on 8/7/24.
//

import Foundation


// MARK: Estrutura condicional


// IF -> Se
// Else -> Senão

// && = E - Todas as alternativas devem ser verdadeiras
// || OU
// / dividir
// * multiplicar
// == -> Igualdade


func IMC(altura: Double, peso: Double) -> String {
    let resultado = peso / (altura * altura)
    
    if resultado <= 18.5 {
        return "Voce esta abaixo do peso! valor do IMC é: \(resultado.rounded())"
    } else if resultado >= 18.6 && resultado <= 24.9 {
        return "Parabéns, voce esta no peso certo! valor do IMC é: \(resultado.rounded())"
    } else if resultado >= 25.0 && resultado <= 29.9 {
        return "voce esta um pouco acima do peso! valor do IMC é: \(resultado.rounded())"
    } else if resultado >= 30.0 && resultado <= 34.9 {
        return "voce esta muito acima do peso! Obesidade grau 1. valor do IMC é: \(resultado.rounded())"
    } else if resultado >= 35 && resultado <= 39.9 {
        return "voce esta muito acima do peso! Obesidade grau 2. valor do IMC é: \(resultado.rounded())"
    } else {
        return "voce esta muito acima do peso! Obesidade grau 3. valor do IMC é: \(resultado.rounded())"
    }
}


print(IMC(altura: 1.76, peso: 120))


func eMaiorIdade(idade: Int) -> String {
    if idade >= 18 {
        return "É maior de idade, pois sua idade é \(idade) anos"
    } else {
        return "É menor de idade, pois sua idade é \(idade) anos"
    }
}


var maiorIdade: String = eMaiorIdade(idade: 16)
print(maiorIdade)


func vouCompreiCarro(tenhaCarteiura: Bool, valorCarro: Double) -> Bool {
    if tenhaCarteiura == true && valorCarro >= 1000.0 {
        return true
    } else {
        return false
    }
}

var meuCarro = vouCompreiCarro(tenhaCarteiura: true, valorCarro: 2000.0)
print(meuCarro)


// Exercicio 1 - Crie uma funcao que se o alunos tiver a media de suas 4 notas superiores a 6 então deve retornar "Parabens, tirou nota azul", se não "Ops, você deve estudar mais!"

func passouDeAno(nota1: Double, nota2: Double, nota3: Double, nota4: Double) -> String {
    let mediaNotas = (nota1 + nota2 + nota3 + nota4) / 4
    
    if mediaNotas > 6 {
        return "Parabens, tirou nota azul"
    } else {
        return "Ops, você deve estudar mais!"
    }
}

let alunoPassouDeAno = passouDeAno(nota1: 7, nota2: 7, nota3: 7, nota4: 4)
print(alunoPassouDeAno)


// exercico 2 - Crie uma funcao que tenha um parametro chamado foiUmMeninoBom que seja do tipo Bool e crie 4 parametros do tipo Double. Se o parametro, foiUmMeninoBom for verdadeiro, então print "Vai Ganhar presente" ou se caso as media das notas forem maior que 6 print "Vai Ganhar presente", caso contrario print "Não vai ganhar presente"


func menino(foiUmMeninoBom: Bool, nota1: Double, nota2: Double, nota3: Double, nota4: Double) {
    if foiUmMeninoBom == true || (nota1 + nota2 + nota3 + nota4) / 4 > 6 {
        print("Vai Ganhar presente")
    } else {
        print("Não vai ganhar presente")
    }
}

print(menino(foiUmMeninoBom: true, nota1: 0, nota2: 0, nota3: 0, nota4: 0))

