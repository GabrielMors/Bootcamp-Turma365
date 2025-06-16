//
//  ViewController.swift
//  Navegacao
//
//  Created by Gabriel Mors  on 8/21/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Tela02Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func tappedTela02Button(_ sender: UIButton) {
//         Acessar o Storyboard chamado Tela02ViewController.storyboard
        let tela02 = UIStoryboard(name: "Tela02ViewController", bundle: nil).instantiateViewController(withIdentifier: "Tela02ViewController") as? Tela02ViewController
    
//        Um Bundle é um objeto (instância da classe Bundle) que representa um conjunto de recursos empacotados. Esses recursos podem ser:
//            •    Arquivos .storyboard, .xib, .plist
//            •    Imagens (.png, .jpeg, etc)
//            •    Áudios, vídeos
//            •    Dados (.json, .xml)
//            •    Bibliotecas dinâmicas (.framework)
//            •    Código compilado (.swiftmodule)
//        Main Bundle (Bundle.main)
//        É o pacote principal do seu app — onde ficam os recursos padrão.
//        Quando você passa bundle: nil, o sistema assume que é o main bundle.
        
        
//MARK: NavigationController
        navigationController?.pushViewController(tela02 ?? UIViewController(), animated: true)
        
//MARK: Modal
//        tela02?.modalPresentationStyle = .fullScreen
//        present(tela02 ?? UIViewController(), animated: true)
    }
    
}

