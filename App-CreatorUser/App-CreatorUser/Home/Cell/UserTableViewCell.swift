//
//  UserTableViewCell.swift
//  App-CreatorUser
//
//  Created by Gabriel Mors  on 9/6/24.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    static let identifier: String = String(describing: UserTableViewCell.self)
//    Um .xib ou .nib é um arquivo de interface visual, criado com o Interface Builder (IB). Ele define componentes de UI (botões, labels, views) e suas conexões (IBOutlet, IBAction) de forma separada do código.
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func setupCell(user: User) {
        userImage.image = user.image
        nameLabel.text = user.name
    }
    
}
