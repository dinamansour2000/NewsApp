

import Foundation
import Alamofire
import SwiftyJSON
import ObjectMapper
import AlamofireObjectMapper


public protocol NewsRequestDelegate: NSObjectProtocol {
    func requestWillSend()
    
    func requestSucceeded(data: NewsModel?)
    
    func requestFailed()
}

class NewsRequest: BaseNewsRequest<NewsModel> {
    
    weak var delegate: NewsRequestDelegate?
    weak var databaseDelegate: NewsDatabaseRequestDelegate?
    
    public override init() {
        super.init()
    }
    
    public func getNewsData(){
        delegate?.requestWillSend()
        getResponseArray(url:   NewsConstant.NEWS_URL, debugResponse: false)
    }
    
    override func onRequestSuccess(data: NewsModel?) {
        delegate?.requestSucceeded(data: data)
        //databaseDelegate?.saveNewsData(data: data)
    }
    
    override func onRequestFail() {
        delegate?.requestFailed()
    }
    
  
}



