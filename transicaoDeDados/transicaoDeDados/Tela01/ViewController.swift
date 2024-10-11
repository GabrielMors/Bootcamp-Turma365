//
//  ViewController.swift
//  transicaoDeDados
//
//  Created by Gabriel Mors  on 8/28/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configElements()
    }

    func configElements() {
        // configuracoes dos elementos
        nameTextField.placeholder = "DIgite seu nome"
    }
    
    @IBAction func tappedDataButton(_ sender: Any) {
//        let controller = UIStoryboard(name: String(describing: Tela02ViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: Tela02ViewController.self)) as? Tela02ViewController
// Nao podemos acessar um componente antes dar vida a ele!!!!!!
//        controller?.nameLabel.text = "Gabriel Mors"
//        controller?.name = nameTextField.text ?? ""
            
        let controller = UIStoryboard(name: String(describing: Tela02ViewController.self), bundle: nil).instantiateViewController(identifier: String(describing: Tela02ViewController.self)) { coder -> Tela02ViewController? in
            
            return Tela02ViewController(coder: coder, name: self.nameTextField.text ?? "")
        }
        
        navigationController?.pushViewController(controller, animated: true)
        nameTextField.text = ""
    }
    
    
    //MARK: CODER é uma referecia da Instancia
    // É uma ferramenta que o sistema usa para criar uma classe a partir do arquivo Storyboard
}

