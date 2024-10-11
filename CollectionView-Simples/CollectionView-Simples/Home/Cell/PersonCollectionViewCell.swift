//
//  PersonCollectionViewCell.swift
//  CollectionView-Simples
//
//  Created by Gabriel Mors  on 9/13/24.
//

import UIKit

class PersonCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    static let identifier: String = String(describing: PersonCollectionViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    public func setupCell(data: Person) {
        nameLabel.text = data.name
    }
    
}
