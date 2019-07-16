

import UIKit

class NewsBackendManager: NSObject {
    
    weak var newsDatabaseRequestDelegate: NewsDatabaseRequestDelegate?
    
    lazy var newsRequest = NewsRequest()
    
    public func getNewsData(delegate: NewsRequestDelegate) {
        newsRequest.delegate = delegate
        newsRequest.databaseDelegate = newsDatabaseRequestDelegate
        newsRequest.getNewsData()
    }
    
    func cancelNewsDatatRequest() {
        newsRequest.cancelRequest()
    }
    
}
