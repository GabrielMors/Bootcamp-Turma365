//
//  HomeScreen.swift
//  App-Roleta
//
//  Created by Gabriel Mors  on 9/30/24.
//

import UIKit

protocol HomeScreenDelegate: AnyObject {
    func tappedRaffleNumberButton()
}

class HomeScreen: UIView {
    
    private weak var delegate: HomeScreenDelegate?
    
    public func delegate(delegate: HomeScreenDelegate) {
        self.delegate = delegate
    }
    
    lazy var logoImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "card")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Type your name:"
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.keyboardType = .default
        return textField
    }()
    
    lazy var raffleNumberButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sortear", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(tappedRaffleButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func tappedRaffleButton(_ sender: UIButton) {
        delegate?.tappedRaffleNumberButton()
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .black
        tableView.register(EmptyTableViewCell.self, forCellReuseIdentifier: EmptyTableViewCell.identifier)
        tableView.register(PersonTableViewCell.self, forCellReuseIdentifier: PersonTableViewCell.identifier)
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstraints()
    }
    
    public func configTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    public func textFieldDelegate(delegate: UITextFieldDelegate) {
        nameTextField.delegate = delegate
    }
    
    private func addElements() {
        addSubview(logoImageView)
        addSubview(nameTextField)
        addSubview(raffleNumberButton)
        addSubview(tableView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
        logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
        logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
        logoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
        logoImageView.heightAnchor.constraint(equalToConstant: 200),
        
        nameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 15),
        nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
        nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        nameTextField.heightAnchor.constraint(equalToConstant: 40),
        
        raffleNumberButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 15),
        raffleNumberButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
        raffleNumberButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        raffleNumberButton.heightAnchor.constraint(equalToConstant: 40),
        
        tableView.topAnchor.constraint(equalTo: raffleNumberButton.bottomAnchor),
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
