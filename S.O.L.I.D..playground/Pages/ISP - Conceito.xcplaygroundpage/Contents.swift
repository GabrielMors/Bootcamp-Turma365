// MARK: Interface Segregation Principle (ISP) (Princípio da Segregação da Interface)

// Muitas interfaces específicas são melhores do que uma interface única.

protocol Worker {
    func work()
    func attendMeeting()
    func writeCode()
    func createDesign()
}

class Manager: Worker {
    func work() {}
    func attendMeeting() {}
    func writeCode() {}
    func createDesign() {}
}

class Developer: Worker {
    func work() {}
    func attendMeeting() {}
    func writeCode() {}
    func createDesign() {}
}

class Designer: Worker {
    func work() {}
    func attendMeeting() {}
    func writeCode() {}
    func createDesign() {}
}


//MARK: Problema
// Gerente: Nao precisa escrever codigo e criar design, mas a interface obriga isso, o que leva a implementações desnecessárias e sem sentido.
// Programador: Não precisa criar desing, mas é forçado a implementar algo que nao faz parte do seu papel.
// Desinger: Não precisa escrever código, mas é forçado a implementar algo que nao faz sentido pra ele.

