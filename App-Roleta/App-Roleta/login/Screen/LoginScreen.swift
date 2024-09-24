//
//  LoginScreen.swift
//  App-Roleta
//
//  Created by Gabriel Mors  on 9/23/24.
//

//MARK: RECEITA DE BOLO VIEWCODE
// Passo a passo

// 1 passo - Criar a Screen (ex: LoginViewController -> LoginScreen, RegisterViewController -> RegisterScreen, HomeViewController -> HomeScreen)
// 2 passo - Chamar o CONSTRUTOR
// 3 passo - Criar elemento (NAO ESQUEÇA DE CHAMAR O translatesAutoresizingMaskIntoConstraints = false)
// 4 passo - Adicionar elemento (Nao esqueça de chamar a funcao)
// 5 passo - Configurar as constraints (Nao esqueça de chamar a funcao)
// 6 passo - Chamar no loadView
// 7 passo - correr pro abraço

import UIKit

class LoginScreen: UIView {
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "LOGIN"
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textAlignment = .center
        return label
    }()
    
    lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person.circle.fill")
        image.contentMode = .scaleAspectFit
        image.tintColor = .blue
        return image
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Digite seu e-mail:"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.autocorrectionType = .no
        textField.textColor = .darkGray
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Digite sua senha:"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .default
        textField.autocorrectionType = .no
        textField.textColor = .darkGray
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.lightGray
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
            addElements()
            configConstraints()
    }
    
    private func addElements() {
        addSubview(loginLabel)
        addSubview(logoImage)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            loginLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            loginLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            logoImage.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 20),
            logoImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: 100),
            logoImage.widthAnchor.constraint(equalToConstant: 100),
            
            emailTextField.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 50),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            loginButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -100),
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            loginButton.widthAnchor.constraint(equalToConstant: 120),
        ])
    }
    
}
