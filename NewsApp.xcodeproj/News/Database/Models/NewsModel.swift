

import Foundation
import ObjectMapper
import RealmSwift
import ObjectMapper_Realm

public class NewsModel: Object, Mappable {
    
    @objc dynamic var status : String? = ""
    @objc dynamic var totalResults : NSNumber? = 0
    var articles = List<DetailsModel>()
    @objc dynamic var id = 0
    
    required convenience public init?(map: Map) {
        self.init()
    }

    override public class func primaryKey() -> String? {
        return "id"
    }
    
    public func mapping(map: Map){
        status <- map["status"]
        totalResults <- map["totalResults"]
        articles <- (map["articles"], ListTransform<DetailsModel>())
   
        
    }
}
