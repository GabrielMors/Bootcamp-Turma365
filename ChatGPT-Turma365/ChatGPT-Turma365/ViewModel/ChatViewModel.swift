//
//  ChatViewModel.swift
//  ChatGPT-Turma365
//
//  Created by Gabriel Mors  on 11/1/24.
//

import UIKit

protocol ChatViewModelProtocol: AnyObject {
    func success()
    func error(message: String)
}

class ChatViewModel {
    
    private weak var delegate: ChatViewModelProtocol?
    private var service: ChatService = ChatService()
    private var messageList: [Message] = []
    
    public func setDelegate(_ delegate: ChatViewModelProtocol) {
        self.delegate = delegate
    }
    
    public var numberOfRowsInSection: Int {
        return messageList.count
    }
    
    public func loadCurrentMessage(indexPath: IndexPath) -> Message {
        return messageList[indexPath.row]
    }
    
    public func addMessage(message: String, type: TypeMessage = .user) {
        messageList.insert(Message(message: message.trimmingCharacters(in: .whitespacesAndNewlines), typeMessage: type), at: .zero)
    }
    
    public func fetchMessage(from userMessage: String) {
        service.requestChat(userMessage) { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let success):
                let chatMessage = success.choices.first?.message.content ?? ""
                self.addMessage(message: chatMessage, type: .chatGPT)
                self.delegate?.success()
            case .failure(let failure):
                let errorMessage = failure.localizedDescription
                print(errorMessage)
                self.addMessage(message: errorMessage, type: .chatGPT)
                self.delegate?.error(message: errorMessage)
            }
        }
    }
    
    public func heightForRow(index: IndexPath) -> CGFloat {
        let message = loadCurrentMessage(indexPath: index)
        let font = UIFont.helveticaNeueMedium(size: 16)
        let estimetedHeight = message.message.heightWithConstrainedWidth(width: 220, font: font)
        return estimetedHeight + 65
    }
}
