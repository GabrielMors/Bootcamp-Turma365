//
//  ViewController.swift
//  ChatGPT-Turma365
//
//  Created by Gabriel Mors  on 10/9/24.
//

import UIKit

class ChatViewController: UIViewController {
    
    var screen: ChatScreen?
    var messageList: [Message] = [Message(message: "Texto que voce vai receber do chatGPT", typeMessage: .chatGPT),
                                  Message(message: "Texto que voce vai enviar", typeMessage: .user),
    ]
    
    override func loadView() {
        screen = ChatScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        screen?.delegate(delegate: self)
        screen?.configTableView(delegate: self, dataSource: self)
    }
    
    private func loadCurrentMessage(indexPath: IndexPath) -> Message {
        return messageList[indexPath.row]
    }
    
    private func heightForRow(index: IndexPath) -> CGFloat {
        let message = loadCurrentMessage(indexPath: index)
        let font = UIFont.helveticaNeueMedium(size: 16)
        let estimetedHeight = message.message.heightWithConstrainedWidth(width: 220, font: font)
        return estimetedHeight + 65
    }
    
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = loadCurrentMessage(indexPath: indexPath)
        
        switch message.typeMessage {
        case .chatGPT:
            let cell = tableView.dequeueReusableCell(withIdentifier: IncomingTableViewCell.identifier, for: indexPath) as? IncomingTableViewCell
            cell?.setupCell(data: message)
            return cell ?? UITableViewCell()
            
        case .user:
            let cell = tableView.dequeueReusableCell(withIdentifier: OutgoingTableViewCell.identifier, for: indexPath) as? OutgoingTableViewCell
            cell?.setupCell(data: message)
            return cell ?? UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightForRow(index: indexPath)
    }
    
}

extension ChatViewController: ChatScreenDelegate {
    
    func didSendMessage(_ message: String) {
        print("Enviou uma mensagem!!!")
    }
    
}
