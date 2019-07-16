

import Foundation
import RealmSwift

class NewsDatabaseRequest: NSObject{
    
    var mDispatchQueue: DispatchQueue?
    
    func saveNewsData(data: NewsModel? ){
        
        if mDispatchQueue == nil{
            mDispatchQueue = DispatchQueue.main //TODO:: performance , we need to convert this ti background
        }
        
        mDispatchQueue?.async {
            let realm = try! Realm()
            realm.beginWrite()
            
            if let dataArray = data {
                let newsModel: NewsModel = dataArray
                realm.add(newsModel, update :true)
            }
            try! realm.commitWrite()
        }
    }
    
    func getNewsData() -> NewsModel?{
        let realm = try! Realm()
        let newsModel = realm.objects(NewsModel.self)
        
        if(!newsModel.isEmpty){
            return newsModel[0]
        }else{
            return nil
        }
    }
    
    func deleteNewsData() {
        mDispatchQueue?.async {
            let realm = try! Realm()
            realm.beginWrite()
            realm.delete(realm.objects(NewsModel.self))
            try! realm.commitWrite()
        }
    }
}


