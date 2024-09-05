//
//  EmployeeTableViewCell.swift
//  TableView-Avancado
//
//  Created by Gabriel Mors  on 9/4/24.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {

    static let identifier: String = String(describing: EmployeeTableViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var salaryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    public func setupCell(data: Employee) {
        userImageView.image = data.image
        nameLabel.text = "Nome: \(data.name)"
        ageLabel.text = "idade: \(data.age)"
        jobLabel.text = "Profissão: \(data.jop)"
        salaryLabel.text = "Salário: $\(data.salary)"
    }
    
}
