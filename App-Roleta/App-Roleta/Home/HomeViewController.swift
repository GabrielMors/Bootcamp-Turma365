//
//  HomeViewController.swift
//  App-Roleta
//
//  Created by Gabriel Mors  on 9/30/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    var screen: HomeScreen?
    var viewModel: HomeViewModel = HomeViewModel()
//    var listPerson: [Person] = []
//    var listImage: [String] = ["Image-1", "Image-2", "Image-3", "Image-4", "Image-5"]
//    var winner: Person?
    
    lazy var alert: AlertController = {
        let alert = AlertController(controller: self)
        return alert
    }()
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        screen?.delegate(delegate: self)
        screen?.configTableView(delegate: self, dataSource: self)
        screen?.textFieldDelegate(delegate: self)
    }
}

extension HomeViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        guard let text = textField.text, !text.isEmpty else { return true }
        
        viewModel.addPerson(name: text, imageList: viewModel.listImage)
        textField.text = ""
        screen?.tableView.reloadData()
        
//        if !(textField.text?.isEmpty ?? false) {
//            listPerson.append(Person(name: textField.text ?? "", image: listImage.randomElement() ?? ""))
//            screen?.tableView.reloadData()
//        }
//        textField.text = ""
        return true
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // FORMA MAIS "SIMPLES" DE FAZER NA ARQUITETURA MVVM
        return viewModel.setPerson.isEmpty ? 1 : viewModel.setPerson.count
        
        // FORMA DE FAZER NA ARQUITETURA MVC
//        if listPerson.count == 0 {
//            return 1
//        } else {
//            return listPerson.count
//        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if viewModel.setPerson.isEmpty {
            let cell = screen?.tableView.dequeueReusableCell(withIdentifier: EmptyTableViewCell.identifier) as? EmptyTableViewCell
            cell?.rouletteView.startRotationAnimation()
            return cell ?? UITableViewCell()
        } else {
            let cell = screen?.tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.identifier) as? PersonTableViewCell
            // FORMA MAIS "SIMPLES" DE FAZER NA ARQUITETURA MVVM
            cell?.setupCell(data: viewModel.getPerson(indexPath: indexPath))
            // FORMA DE FAZER NA ARQUITETURA MVC
//            cell?.setupCell(data: listPerson[indexPath.row])
            return cell ?? UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // FORMA MAIS "SIMPLES" DE FAZER NA ARQUITETURA MVVM
        viewModel.selectPerson(at: indexPath)
        
        // FORMA DE FAZER NA ARQUITETURA MVC
//        if let personWinner = winner, listPerson[indexPath.row] === personWinner {
//            alert.showAlert(title: "Muito bom", message: "Agora é sua vez \(personWinner.name), pague a conta!!!")
//            listPerson.removeAll()
//        } else {
//            alert.showAlert(title: "Uff", message: "Voce escapou dessa vez!!!!")
//            listPerson.remove(at: indexPath.row)
//        }
        screen?.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // FORMA MAIS "SIMPLES" DE FAZER NA ARQUITETURA MVVM
        return viewModel.setPerson.isEmpty ? 300 : 100
        
        // FORMA DE FAZER NA ARQUITETURA MVC
//        if listPerson.count == 0 {
//            return 300
//        } else {
//            return 100
//        }
    }

}

extension HomeViewController: HomeScreenDelegate {
    
    func tappedRaffleNumberButton() {
        alert.showAlert(title: "Pronto", message: "Foi sortado os membros que irão pagar a conta. Clique na célula e veja quem será o sortudo.")
        viewModel.randomPersonList()
    }
    
}
