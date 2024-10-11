//
//  ViewController.swift
//  RevisandoNavegacao
//
//  Created by Gabriel Mors  on 8/23/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var customButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tela 01"
    }

    @IBAction func tappedCustomButton(_ sender: UIButton) {
        guard let controller = UIStoryboard(name: String(describing: Tela02ViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: Tela02ViewController.self)) as? Tela02ViewController else { return }
        
        navigationController?.pushViewController(controller, animated: true)
    }
    
}

