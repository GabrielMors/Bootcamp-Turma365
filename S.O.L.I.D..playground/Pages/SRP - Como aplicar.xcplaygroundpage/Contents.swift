import Foundation

class RequestManager {
    func requestTwitter() -> Data {
        return Data()
    }
    
    func requestFacebook() -> Data {
        return Data()
    }
}


class ParseManager {
    func convertJsonToModel(with data: Data) -> [AnyObject] {
        return [AnyObject]()
    }
}

class CoreDataManager {
    fileprivate func saveInCoreData(with models: [AnyObject]) {
        // Salva o modelo no seu core data
    }
}

class TwitterManager {
    private let request: RequestManager
    private let parser: ParseManager
    private let coreData: CoreDataManager
    
    init(request: RequestManager, parser: ParseManager, coreData: CoreDataManager) {
        self.request = request
        self.parser = parser
        self.coreData = coreData
    }
    
    func createrTweet(with text: String) {
        let data = request.requestTwitter()
        let object = parser.convertJsonToModel(with: data)
        coreData.saveInCoreData(with: object)
    }
}
