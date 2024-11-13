//
//  ViewController.swift
//  ChatGPT-Turma365
//
//  Created by Gabriel Mors  on 10/9/24.
//

import UIKit

class ChatViewController: UIViewController {
    
    var screen: ChatScreen?
    var viewModel: ChatViewModel = ChatViewModel()
    
    override func loadView() {
        screen = ChatScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        viewModel.setDelegate(self)
        screen?.delegate(delegate: self)
        screen?.configTableView(delegate: self, dataSource: self)
    }
    
    private func reloadTableView() {
        //    Essa linha recarrega os dados da tableView na thread principal (main thread).
        //    A DispatchQueue.main.async é usada para garantir que a atualização da interface gráfica (UI) ocorra na thread principal, pois toda a manipulação de UI no iOS precisa ser feita na main thread.
        //    DispatchQueue é uma estrutura que gerencia filas de execução (chamadas de threads) no iOS.
        DispatchQueue.main.async {
            self.screen?.tableView.reloadData()
        }
        vibrate()
    }
    
    private func vibrate() {
        let genetator = UIImpactFeedbackGenerator(style: .medium)
        genetator.prepare()
        genetator.impactOccurred()
    }
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = viewModel.loadCurrentMessage(indexPath: indexPath)
        
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
        return viewModel.heightForRow(index: indexPath)
    }
    
}

extension ChatViewController: ChatViewModelProtocol {
    func success() {
        reloadTableView()
    }
    
    func error(message: String) {
        reloadTableView()
    }
}

extension ChatViewController: ChatScreenDelegate {
    
    func didSendMessage(_ message: String) {
        viewModel.addMessage(message: message, type: .user)
        reloadTableView()
        viewModel.fetchMessage(from: message)
        screen?.inputMessageTextField.text = ""
    }
    
}
