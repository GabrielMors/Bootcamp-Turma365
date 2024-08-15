//
//  ViewController.swift
//  IBOulet - IBAction
//
//  Created by Gabriel Mors  on 8/9/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var nameTwoLabel: UILabel!
    @IBOutlet weak var enterButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTwoLabel.text = "Nathalia Neves"
        nameTwoLabel.backgroundColor = .red
        nameTwoLabel.textAlignment = .left
        nameTwoLabel.isEnabled = true
        enterButton.backgroundColor = .blue
    }

    @IBAction func tappedRegisterButton(_ sender: UIButton) {
        
    }
    
}

