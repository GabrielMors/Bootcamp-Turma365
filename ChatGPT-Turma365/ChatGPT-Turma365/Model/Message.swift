//
//  Message.swift
//  ChatGPT-Turma365
//
//  Created by Gabriel Mors  on 10/9/24.
//

import Foundation

enum TypeMessage {
    case user
    case chatGPT
}

struct Message {
    var message: String
    var typeMessage: TypeMessage
}
