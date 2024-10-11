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
        let tela02 = UIStoryboard(name: "Tela02ViewController", bundle: nil).instantiateViewController(withIdentifier: "Tela02ViewController") as? Tela02ViewController
    
//MARK: NavigationController
        navigationController?.pushViewController(tela02 ?? UIViewController(), animated: true)
        
//MARK: Modal
//        tela02?.modalPresentationStyle = .fullScreen
//        present(tela02 ?? UIViewController(), animated: true)
    }
    
}

