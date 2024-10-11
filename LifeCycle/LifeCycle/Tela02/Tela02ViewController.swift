//
//  Tela02ViewController.swift
//  LifeCycle
//
//  Created by Gabriel Mors  on 8/23/24.
//

import UIKit

class Tela02ViewController: UIViewController {
    
    // Metodo quando a tela está preste a ser apresentado
    // Antes de view aparecer, esse método é chamado
    override func viewWillAppear(_ animated: Bool) {
        print(#function)
// configuracoes de navegacao entre telas
// Timer ou Animaçao
// navigationController?.navigationBar.isHidden = true
// navigationItem.rightBarButtonItem?.title = "Voltar!!!"
    }
    
    // Método quando a tela é RENDERIZADA (Ou seja, será disparado apenas 1 vez!!!!!!!!)
    // Antes da view ser exibida esse metodo é chamado automaticamente
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        // Métodos de configuracoes iniciais da View!!!
    }
    
    // Método quando a tela esta apresentado por completo
    // APARECEU PRO USUÁRIO
    override func viewDidAppear(_ animated: Bool) {
        print(#function)
        // Timer ou Animaçao
    }
    
    // Método quando a tela esta preste a sair (Ou seja, antes da tela sair, esse metodos é chamado)
    override func viewWillDisappear(_ animated: Bool) {
        print(#function)
        // Timer ou Animaçao
    }
    
    // Método quando a tela desapareceu por completo
    override func viewDidDisappear(_ animated: Bool) {
        print(#function)
        // Timer ou Animaçao
    }
    

}
