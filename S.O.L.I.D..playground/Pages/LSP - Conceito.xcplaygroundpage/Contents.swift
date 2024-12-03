// MARK: The Liskov Substitution Principle (LSP) (Princípio da Substituição de Liskov)

// As classes BASE devem ser substituíveis por suas classe derivadas.

import Foundation

class Bird {
    func fly() -> String {
        return "I can fly!"
    }
}

class Sparrow: Bird {}

class Penguin: Bird {
    override func fly() -> String {
        return "I can't fly!" // Violação do LSP
    }
}

func makeBirdFly(bird: Bird) {
    print(bird.fly())
}

let sparrow = Sparrow()
let penguin = Penguin()


makeBirdFly(bird: sparrow) // I can fly
makeBirdFly(bird: penguin) // I can't fly (Comportamento Inesperado)





//MARK: Exemplo de BANCO

class Conta {
    let saldo: Double
    
    init(saldo: Double) {
        self.saldo = saldo
    }
    
    func sacar(valor: Double) -> Double {
        return saldo - valor
    }
}

class ContaPoupanca: Conta {}

class ContaDepositoAPrazo: Conta {
    override func sacar(valor: Double) -> Double { // Violação do LSP
        fatalError("Saque não permitido em contas de depósito a prazo")
    }
}

func processarSaque(conta: Conta, valor: Double) {
    print("Realizando saque de \(valor) na conta...")
    let saldoRestante = conta.sacar(valor: valor)
    print("Saldo restante: \(saldoRestante)")
}

let poupança = ContaPoupanca(saldo: 1000)
let depositoAPrazo = ContaDepositoAPrazo(saldo: 5000)

processarSaque(conta: poupança, valor: 200) // Funciona.
processarSaque(conta: depositoAPrazo, valor: 200) // FatalError.


//MARK: Problema

// A classe ContaDepositoAPrazo é uma subclasse de Conta, mas nao pode implementar o comportamento de saque, ja que saque nao sao permitidos nesse tipo de conta
// O uso do método sacar em uma instancia de ContaDepositoAPrazo var gerar um erro em tempo de execução.


