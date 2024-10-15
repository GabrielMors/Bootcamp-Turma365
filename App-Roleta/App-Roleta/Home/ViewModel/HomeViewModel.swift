//
//  HomeViewModel.swift
//  App-Roleta
//
//  Created by Gabriel Mors  on 10/14/24.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func didShowAlert(title: String, message: String)
}

class HomeViewModel: NSObject {
    
    weak var delegate: HomeViewModelDelegate?
    var listImage: [String] = ["Image-1", "Image-2", "Image-3", "Image-4", "Image-5"]
    var winner: Person?
    
    private var personList: [Person] = []
    
    public var setPerson: [Person] {
        personList
    }
    
    public func getPerson(indexPath: IndexPath) -> Person {
        return personList[indexPath.row]
    }
    
    public func selectPerson(at indexPath: IndexPath) {
        if let personWinner = winner, personList[indexPath.row] === personWinner {
            delegate?.didShowAlert(title: "Muito bom", message: "Agora é sua vez \(personWinner.name), pague a conta!!!")
            clearPersonList()
        } else {
            delegate?.didShowAlert(title: "Uff", message: "Voce escapou dessa vez!!!!")
            personList.remove(at: indexPath.row)
        }
    }
    
    public func addPerson(name: String, imageList: [String]) {
        let randomImage = imageList.randomElement() ?? ""
        let person = Person(name: name, image: randomImage)
        personList.append(person)
    }
    
    private func clearPersonList() {
        personList.removeAll()
    }
    
    public func randomPersonList() -> Person? {
        personList.randomElement()
    }
}
