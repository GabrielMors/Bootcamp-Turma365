//
//  ChatScreen.swift
//  ChatGPT-Turma365
//
//  Created by Gabriel Mors  on 10/9/24.
//

import UIKit

protocol ChatScreenDelegate: AnyObject {
    func didSendMessage(_ message: String)
}

class ChatScreen: UIView {
    
    weak private var delegate: ChatScreenDelegate?
    
    public func delegate(delegate: ChatScreenDelegate) {
        self.delegate = delegate
    }
    
    lazy var tableView: UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.register(OutgoingTableViewCell.self, forCellReuseIdentifier: OutgoingTableViewCell.identifier)
        tableView.register(IncomingTableViewCell.self, forCellReuseIdentifier: IncomingTableViewCell.identifier)
        tableView.transform = CGAffineTransform(scaleX: 1, y: -1)
        return tableView
    }()
    
    lazy var messageInputView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .background
        return view
    }()
    
    lazy var messageBarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        view.backgroundColor = .appLight
        return view
    }()
    
    lazy var inputMessageTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.placeholder = "Digite aqui:"
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        textField.keyboardType = .default
        textField.backgroundColor = .clear
        textField.delegate = self
        return textField
    }()
    
    lazy var sendButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "send"), for: .normal)
        button.backgroundColor = .buttonColor
        button.clipsToBounds = true
        button.layer.cornerRadius = 22.5
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 5)
        button.layer.shadowOpacity = 0.4
        button.layer.shadowRadius = 10
        button.isEnabled = false
        button.addTarget(self, action: #selector(tappedSendButton), for: .touchUpInside)
        button.transform = .init(scaleX: 0.8, y: 0.8)
        return button
    }()
    
    @objc private func tappedSendButton() {
        delegate?.didSendMessage(inputMessageTextField.text ?? "Aqui quando o texto for nil")
        pushMessage()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    private func addElements() {
        addSubview(tableView)
        addSubview(messageInputView)
        addSubview(sendButton)
        messageInputView.addSubview(messageBarView)
        messageInputView.addSubview(inputMessageTextField)
    }
    
    private func pushMessage() {
        inputMessageTextField.text = ""
        sendButton.isEnabled = false
        sendButton.transform = .init(scaleX: 0.8, y: 0.8)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: messageInputView.topAnchor),
            
            messageInputView.leadingAnchor.constraint(equalTo: leadingAnchor),
            messageInputView.trailingAnchor.constraint(equalTo: trailingAnchor),
            messageInputView.heightAnchor.constraint(equalToConstant: 80),
            messageInputView.bottomAnchor.constraint(equalTo: keyboardLayoutGuide.topAnchor),
            
            messageBarView.leadingAnchor.constraint(equalTo: messageInputView.leadingAnchor, constant: 20),
            messageBarView.trailingAnchor.constraint(equalTo: messageInputView.trailingAnchor, constant: -20),
            messageBarView.heightAnchor.constraint(equalToConstant: 55),
            messageBarView.centerYAnchor.constraint(equalTo: messageInputView.centerYAnchor),
            
            sendButton.heightAnchor.constraint(equalToConstant: 55),
            sendButton.widthAnchor.constraint(equalToConstant: 55),
            sendButton.trailingAnchor.constraint(equalTo: messageBarView.trailingAnchor, constant: -15),
            sendButton.centerYAnchor.constraint(equalTo: messageInputView.centerYAnchor),
            
            inputMessageTextField.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor, constant: -5),
            inputMessageTextField.leadingAnchor.constraint(equalTo: messageBarView.leadingAnchor, constant: 20),
            inputMessageTextField.heightAnchor.constraint(equalToConstant: 45),
            inputMessageTextField.centerYAnchor.constraint(equalTo: messageBarView.centerYAnchor)
        ])
    }
}

extension ChatScreen: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text as NSString? else { return false }
        let txtAfterUpdate = text.replacingCharacters(in: range, with: string)
        
        if txtAfterUpdate.isEmpty {
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.sendButton.isEnabled = false
                self.sendButton.transform = .init(scaleX: 0.8, y: 0.8)
            }, completion: { _ in
            })
        } else {
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.sendButton.isEnabled = true
                self.sendButton.transform = .identity
            }, completion: { _ in
            })
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
