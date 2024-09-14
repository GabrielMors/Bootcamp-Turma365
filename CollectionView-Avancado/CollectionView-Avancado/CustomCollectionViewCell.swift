//
//  CustomCollectionViewCell.swift
//  CollectionView-Avancado
//
//  Created by Gabriel Mors  on 9/13/24.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var carImageView: UIImageView!

    static let identifier: String = String(describing: CustomCollectionViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    public func setupCell(data: Car) {
        carImageView.image = UIImage(named: data.name)
    }
}
