//
//  Teste_UnitarioTests.swift
//  Teste-UnitarioTests
//
//  Created by Gabriel Mors  on 11/25/24.
//

import XCTest // Para acessar o framework que contém todas as ferramentas para teste.
@testable import Teste_Unitario // Para acessar menbro internal do módulo em testes.

final class Teste_UnitarioTests: XCTestCase {
// Está classe contém testes para o código no projeto principal
    
    var viewController: ViewController!
    
    override func setUpWithError() throws {
//        Este método é chamado antes da execução de cada método de teste.
//        Ou sej,a o primeiro a ser chamado é ele. (Como se fosse o viewDidLoad)
//        Pode ser usado para configurar o ambiente de teste, por exemplo, instanciar objetos necessarios.
        viewController = ViewController()
    }

    override func tearDownWithError() throws {
//        Este é o méto0do chamado após a execução de cada metodo de teste.
//        Imagina ele como o viewDidDisappear, quando ja finalizado o teste.
//        Pode ser usado para relaizar limpezas ou liberar recursos utilizados nos teste
        viewController = nil
    }

    func testExample() throws {
        let valorTotal = 10 + 10
        XCTAssertEqual(20, valorTotal)
    }
    
    func testPerformanceExample() throws {
//         Este é um exemplo de um teste de desempenho.
//        Voce Pode medir o desempenho de uma determinada parte do código.
//         O tempo de execução da parte dentro do bloco 'self.measure' será registrado.
        self.measure {
           // Coloque o codigo que vc deseja medir aqui
        }
    }

}
