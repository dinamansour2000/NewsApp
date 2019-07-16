

import UIKit

protocol NewsDatabaseRequestDelegate: NSObjectProtocol {
    
    func saveNewsData(data: NewsModel?)
}

class NewsViewModel: NSObject {
    lazy var backendManager = NewsBackendManager();
    lazy var dbManager = NewsDBManager()
    
    //
    //MARK: Network Request
    //
    public func getNewsData(delegate: NewsRequestDelegate) {
        backendManager.newsDatabaseRequestDelegate = self
        backendManager.getNewsData(delegate: delegate);
    }
    
    //
    // MARK: Cancel Network Request
    //
    func cancelNewsDatatRequest() {
        backendManager.cancelNewsDatatRequest()
    }
    
    //
    // MARK: Get Offline Data
    //
    public func getOfflineNewsData() -> NewsModel?{
        return dbManager.getNewsData()
    }
}

//
//MARK: DB Request
//
extension NewsViewModel: NewsDatabaseRequestDelegate {
    
    
    
    
    
    
    func saveNewsData(data: NewsModel?){
        dbManager.deleteNewsData()
        dbManager.saveNewsData(data: data)
    }
}

