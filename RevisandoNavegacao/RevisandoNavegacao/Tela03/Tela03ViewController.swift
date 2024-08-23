//
//  Tela03ViewController.swift
//  RevisandoNavegacao
//
//  Created by Gabriel Mors  on 8/23/24.
//

import UIKit

class Tela03ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func tappedNextButton(_ sender: UIButton) {
        guard let controller = UIStoryboard(name: String(describing: Tela04ViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: Tela04ViewController.self)) as? Tela04ViewController else { return }
        
        navigationController?.pushViewController(controller, animated: true)
    }
   
    @IBAction func tappedBackButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
