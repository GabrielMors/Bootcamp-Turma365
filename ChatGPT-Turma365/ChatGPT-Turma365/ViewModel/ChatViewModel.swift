//
//  ChatViewModel.swift
//  ChatGPT-Turma365
//
//  Created by Gabriel Mors  on 11/1/24.
//

import UIKit

class ChatViewModel {
    
    private var messageList: [Message] = []
    
    public var numberOfRowsInSection: Int {
        return messageList.count
    }
    
    public func loadCurrentMessage(indexPath: IndexPath) -> Message {
        return messageList[indexPath.row]
    }
    
    public func addMessage(message: String, type: TypeMessage = .user) {
        messageList.insert(Message(message: message.trimmingCharacters(in: .whitespacesAndNewlines), typeMessage: type), at: .zero)
    }
    
    public func heightForRow(index: IndexPath) -> CGFloat {
        let message = loadCurrentMessage(indexPath: index)
        let font = UIFont.helveticaNeueMedium(size: 16)
        let estimetedHeight = message.message.heightWithConstrainedWidth(width: 220, font: font)
        return estimetedHeight + 65
    }
}
