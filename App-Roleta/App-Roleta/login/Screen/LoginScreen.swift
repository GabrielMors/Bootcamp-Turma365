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
//AnyObject é um tipo especial em Swift que representa qualquer instância de classe. Quando você coloca isso em um protocolo:
//Esse protocolo só pode ser adotado por classes.
protocol LoginScreenProtocol: AnyObject { //Limita o protocolo para ser adotado apenas por classes
    func tappedRegisterButton()
}
//Garante que delegate possa ser weak, evitando retain cycles

class LoginScreen: UIView {
//    A palavra weak só pode ser usada com classes.
//    Porque só classes têm comportamento de referência e podem ser liberadas da memória (deinit). Structs não têm isso.
    weak var delegate: LoginScreenProtocol?
    
//    O lazy var no Swift é literalmente um “preguiçoso” — ele só executa a closure e cria o valor quando a propriedade for usada pela primeira vez.
//    Pensa assim:
//    Eu não quero criar esse UILabel agora…
//    Só vou criar quando alguém realmente usar ele.
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
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.lightGray
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedLoginButton(_ sender: UIButton) {
        delegate?.tappedRegisterButton()
    }
    
//    frame → layout fixo, você desenha o retângulo inteiro.
//    Auto Layout → layout responsivo, você define regras de posição e tamanho.
    override init(frame: CGRect) {
        super.init(frame: frame) // Serve para configurar tamanho e posição manual de uma view. Não se adapta ao tamanho da tela (iPhone SE ≠ iPhone 15 Pro Max)
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
    
//    Esse init é exigido caso você queira usar sua view com Storyboard/XIB. Como você está usando ViewCode, pode só colocar o fatalError mesmo — é padrão.
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
