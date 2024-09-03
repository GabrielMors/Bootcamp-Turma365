//
//  CustomTableViewCell.swift
//  TableView
//
//  Created by Gabriel Mors  on 9/2/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    static let identifier: String = String(describing: CustomTableViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    @IBOutlet weak var nameLabel: UILabel!
 
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}
