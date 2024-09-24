//
//  ViewController.swift
//  App-Roleta
//
//  Created by Gabriel Mors  on 9/23/24.
//

import UIKit

class LoginViewController: UIViewController {

    var screen: LoginScreen?
    
    override func loadView() {
        screen = LoginScreen()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
    }


}

