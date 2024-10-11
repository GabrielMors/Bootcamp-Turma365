//
//  Tela02ViewController.swift
//  Navegacao
//
//  Created by Gabriel Mors  on 8/21/24.
//

import UIKit

class Tela02ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tappedBackTela02Button(_ sender: UIButton) {
        
//        let tela03 = UIStoryboard(name: "Tela03ViewController", bundle: nil).instantiateViewController(withIdentifier: "Tela03ViewController") as? Tela03ViewController
//    
////MARK: NavigationController
//        navigationController?.pushViewController(tela03 ?? UIViewController(), animated: true)
//        
        

//MARK: NavigationController
        navigationController?.popViewController(animated: true)
                
//MARK: Modal
//        dismiss(animated: true)
    }


}
