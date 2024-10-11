//
//  ViewController.swift
//  TableView
//
//  Created by Gabriel Mors  on 9/2/24.
//

import UIKit

// PASSO A PASSO
    
// 1 - Criar sua TableView
// 2 - Fazer conexão
// 3 - ASSINAR os protocolos ( UITableViewDelegate, UITableViewDataSource)
// 4 - Criar sua célula
// 5 - Criar identifier da célula
// 6 - Registrar nossa célula
// 7 - Popular nossa célula na tableView
// 8 - Retornar nossa célula
    
    
class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrayNames: [String] = ["Gabriel", "Nathalia", "Caio",
                                "Gabriel", "Nathalia", "Caio",
                                "Gabriel", "Nathalia", "Caio",
                                "Gabriel", "Nathalia", "Caio",
                                "Gabriel", "Nathalia", "Caio",
                                "Gabriel", "Nathalia", "Caio",
                                "Gabriel", "Nathalia", "Caio",
                                "Gabriel", "Nathalia", "Caio",
                                "Gabriel", "Nathalia", "Caio",
                                "Gabriel", "Nathalia", "Caio",
                                "Gabriel", "Nathalia", "Caio",
                                "Gabriel", "Nathalia", "Caio",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView() // nao esqueça de chamar a funcao
    }

    private func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Serve para colocar quantas células irá aparecer na tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayNames.endIndex
    }
    
    // Serve para popular nossa tableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
        cell?.nameLabel.text = arrayNames[indexPath.row]
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Index da celula selecionada: \(indexPath.row)")
    }
    
}



