//
//  RegisterViewController.swift
//  App-Roleta
//
//  Created by Gabriel Mors  on 9/27/24.
//

import UIKit

class RegisterViewController: UIViewController {

    var screen: RegisterScreen?
    
    override func loadView() {
        screen = RegisterScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }

}
