//MARK: S Single Responsiblity Principle - Princípio da responsabilidade única (SRP)
//MARK: Definição -> Uma classe deve ter um, e somente um, motivo para existir.

import Foundation

class TwitterService {
    private func request() -> Data {
        return Data()
    }
    
    private func convertJsonToModel(with data: Data) -> [AnyObject] {
        return [AnyObject]()
    }
    
    private func saveInCoreData(with models: [AnyObject]) {
        // Salva o modelo no seu core data
    }
    
    func createrTweet(with text: String) {
        let data = request()
        let models = convertJsonToModel(with: data)
        saveInCoreData(with: models)
    }
}

//MARK: Qual o problema do código acima?
//  ***A classe faz muitas coisas diferentes:***
//- Realiza uma requisição de dados (request).
//- Converte o JSON retornado para modelos (convertJsonToModel).
//- Salva esses modelos no Core Data (saveInCoreData).
//- Gerencia o processo de criação de um tweet (createTweet).








