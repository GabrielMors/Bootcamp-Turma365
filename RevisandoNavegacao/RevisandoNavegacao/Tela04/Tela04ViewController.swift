//
//  Tela04ViewController.swift
//  RevisandoNavegacao
//
//  Created by Gabriel Mors  on 8/23/24.
//

import UIKit

class Tela04ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tappedBackButton(_ sender: Any) {
        // Volta para tela anterior
        navigationController?.popViewController(animated: true)
    }
    
   
    @IBAction func tappedRootViewController(_ sender: Any) {
        // Voltar para tela root (Tela RAIZ da nossa navigationController)
        navigationController?.popToRootViewController(animated: true)
    }
    
}
