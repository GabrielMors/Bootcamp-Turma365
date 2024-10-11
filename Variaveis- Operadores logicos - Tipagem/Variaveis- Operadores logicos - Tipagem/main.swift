//
//  main.swift
//  Variaveis- Operadores logicos - Tipagem
//
//  Created by Gabriel Mors  on 8/5/24.
//

import Foundation

// O que é uma varaivel

var myName = "Gabriel"
print(myName)
myName = "Fernando"
print(myName)

let myLastName = "Mors"
//myLastName = "12334"

//MARK: Tipo de dados

// Double -> Contem MAIS casa decimais 10.129874398798120
// Float ->  Contem MENOS casa decimais 10.1298
// Int -> Numero inteiro 10
// String -> tipo texto "Gabriel"
// Bool -> True or false

var double: Double = 10.20312093812903
print(double)

var float: Float = 10.20312093812903
print(float)

var int: Int = 10
print(int)

var string: String = "Nathalia"
print(string)

var bool: Bool = false
print(bool)

//MARK: Operadores logicas

// Adiçao
var numeroAdicao1: Int = 150
var numeroAdicao2: Int = 50
var resultadoAdicao: Int = numeroAdicao1 + numeroAdicao2
print(resultadoAdicao)

// Subtraçao
var numeroSubtracao1: Int = 150
var numeroSubtracao2: Int = 50
var resultadoSubtracao: Int = numeroSubtracao1 - numeroSubtracao2
print(resultadoSubtracao)

// Multiplicaçao
var numeroMultiplicacao1: Int = 150
var numeroMultiplicacao2: Int = 50
var resultadoMultiplicacao: Int = numeroMultiplicacao1 * numeroMultiplicacao2
print(resultadoMultiplicacao)

// Divisao
var numeroDivisao1: Int = 150
var numeroDivisao2: Int = 50
var resultadoDivisao: Int = numeroDivisao1 / numeroDivisao2
print(resultadoDivisao)


//MARK: Converter Tipos
 
var tamanhoCamisaInt: Int = 12
print(tamanhoCamisaInt)
var tamanhoCamisaString: String = String(tamanhoCamisaInt)
print(tamanhoCamisaString)


var valorString: String = "123s12312"
print(valorString)
var valorInt: Int = Int(valorString) ?? 0
print(valorInt)


// Coalecência -> ??

var numeroDouble: Double = 15.43234234234234
print(numeroDouble)
var numeroFloat: Float = Float(numeroDouble)
print(numeroFloat)

