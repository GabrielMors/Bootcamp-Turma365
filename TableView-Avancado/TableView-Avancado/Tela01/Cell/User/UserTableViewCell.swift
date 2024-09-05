//
//  UserTableViewCell.swift
//  TableView-Avancado
//
//  Created by Gabriel Mors  on 9/4/24.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    static let identifier: String = String(describing: UserTableViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    public func setupCell(data: User) {
        nameLabel.text = data.name
        userImage.image = data.image
    }
}
