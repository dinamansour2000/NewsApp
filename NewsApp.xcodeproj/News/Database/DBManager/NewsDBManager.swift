

import UIKit

class NewsDBManager {
    
    lazy var newsDbRequest = NewsDatabaseRequest()
    
    func saveNewsData(data: NewsModel? ){
        newsDbRequest.saveNewsData(data: data)
    }
    
    func getNewsData() -> NewsModel? {
        return newsDbRequest.getNewsData()
    }
    
    func deleteNewsData(){
        newsDbRequest.deleteNewsData()
    }
}
