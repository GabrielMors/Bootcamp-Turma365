// As classes BASE devem ser substituíveis por suas classe derivadas.
import Foundation

// A classe Bird é a BASE para todos os tipos de pássaros
class Bird {
    
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

class FlyingBird: Bird { // Classe Derivada
    func fly() -> String {
        return "\(name) is flying"
    }
}

class NonFlyingBird: Bird {} // Classe Derivada

class Sparrow: FlyingBird {}

class Penguin: NonFlyingBird {}


func makeFlyingBirdFly(bird: FlyingBird) {
    print(bird.fly())
}

let sparrow = Sparrow(name: "Sparrow")
let penguin = Penguin(name: "Penguin")


makeFlyingBirdFly(bird: sparrow)
//makeFlyingBirdFly(bird: penguin)





//MARK: Exemplo do BANCO

protocol Sacavel {
    func sacar(valor: Double) -> Double
}

class Conta {
    let saldo: Double
    
    init(saldo: Double) {
        self.saldo = saldo
    }
}

class ContaPoupanca: Conta, Sacavel {
    
    func sacar(valor: Double) -> Double {
        guard valor <= saldo else {
            fatalError("Saldo Insuficiente")
        }
        return saldo - valor
    }
}

class ContaDepositoAPrazo: Conta {}

func processarSaque(conta: Sacavel, valor: Double) {
    print("Realizando saque de \(valor) na conta...")
    let saldoRestante = conta.sacar(valor: valor)
    print("Saldo restante: \(saldoRestante)")
}

let poupança = ContaPoupanca(saldo: 1000)
let depositoAPrazo = ContaDepositoAPrazo(saldo: 5000)

processarSaque(conta: poupança, valor: 200) // Funciona.
//processarSaque(conta: depositoAPrazo, valor: 200) // FatalError.

