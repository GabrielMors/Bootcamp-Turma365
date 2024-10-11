//
//  Tela02ViewController.swift
//  RevisandoNavegacao
//
//  Created by Gabriel Mors  on 8/23/24.
//

import UIKit

class Tela02ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func tappedNextButton(_ sender: Any) {
        guard let controller = UIStoryboard(name: String(describing: Tela03ViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: Tela03ViewController.self)) as? Tela03ViewController else { return }
        
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func tappedBackButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
