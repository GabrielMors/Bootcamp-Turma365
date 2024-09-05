//
//  ViewController.swift
//  TableView-Avancado
//
//  Created by Gabriel Mors  on 9/4/24.
//

import UIKit

// 1 - Criar sua TableView
// 2 - Fazer conexão
// 3 - ASSINAR os protocolos ( UITableViewDelegate, UITableViewDataSource)
// 4 - Criar sua célula
// 5 - Criar o modelo
// 6 - Criar identifier da célula
// 7 - Registrar nossa célula
// 8 - Popular nossa célula na tableView
// 9 - Retornar nossa célula
    

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var employeeList: [Employee] = [Employee(name: "Gabriel Mors", age: 19, jop: "iOS Developer", salary: "100", image: UIImage(systemName: "person.circle.fill") ?? UIImage()),
                                    Employee(name: "Wagner", age: 32, jop: "iOS Developer", salary: "6.000", image: UIImage(systemName: "person.circle.fill") ?? UIImage()),
                                    Employee(name: "Nathalia", age: 19, jop: "iOS Developer", salary: "10.000", image: UIImage(systemName: "person.circle.fill") ?? UIImage()),
                                    Employee(name: "Gabriel Mors", age: 19, jop: "iOS Developer", salary: "100", image: UIImage(systemName: "person.circle.fill") ?? UIImage()),
                                    Employee(name: "Gabriel Mors", age: 19, jop: "iOS Developer", salary: "100", image: UIImage(systemName: "person.circle.fill") ?? UIImage()),
                                    Employee(name: "Gabriel Mors", age: 19, jop: "iOS Developer", salary: "100", image: UIImage(systemName: "person.circle.fill") ?? UIImage()),
                                    Employee(name: "Gabriel Mors", age: 19, jop: "iOS Developer", salary: "100", image: UIImage(systemName: "person.circle.fill") ?? UIImage()),
                                    Employee(name: "Gabriel Mors", age: 19, jop: "iOS Developer", salary: "100", image: UIImage(systemName: "person.circle.fill") ?? UIImage()),
                                    Employee(name: "Wagner", age: 32, jop: "iOS Developer", salary: "6.000", image: UIImage(systemName: "person.circle.fill") ?? UIImage()),
                                    Employee(name: "Nathalia", age: 19, jop: "iOS Developer", salary: "10.000", image: UIImage(systemName: "person.circle.fill") ?? UIImage()),
                                    Employee(name: "Gabriel Mors", age: 19, jop: "iOS Developer", salary: "100", image: UIImage(systemName: "person.circle.fill") ?? UIImage()),
                                    Employee(name: "Gabriel Mors", age: 19, jop: "iOS Developer", salary: "100", image: UIImage(systemName: "person.circle.fill") ?? UIImage()),
                                    Employee(name: "Gabriel Mors", age: 19, jop: "iOS Developer", salary: "100", image: UIImage(systemName: "person.circle.fill") ?? UIImage()),
                                    Employee(name: "Gabriel Mors", age: 19, jop: "iOS Developer", salary: "100", image: UIImage(systemName: "person.circle.fill") ?? UIImage()),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }

    private func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UserTableViewCell.nib(), forCellReuseIdentifier: UserTableViewCell.identifier)
        tableView.register(EmployeeTableViewCell.nib(), forCellReuseIdentifier: EmployeeTableViewCell.identifier)
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 + employeeList.endIndex
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as? UserTableViewCell
            cell?.setupCell(data: User(image: UIImage(systemName: "square.and.arrow.up") ?? UIImage(), name: "Gabriel Mors"))
            return cell ?? UITableViewCell()
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeTableViewCell.identifier, for: indexPath) as? EmployeeTableViewCell
            cell?.setupCell(data: employeeList[indexPath.row - 1])
            return cell ?? UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 150
        } else {
            return 250
        }
    }
}

