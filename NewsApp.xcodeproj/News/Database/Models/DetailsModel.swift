//
//  DetailsModel.swift
//  NewsApp
//
//  Created by user on 7/15/19.
//  Copyright © 2019 MAF. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift
import ObjectMapper_Realm

public class DetailsModel: Object, Mappable {
    
    @objc dynamic var source: SourceModel?
    @objc dynamic var author: String? = ""
    @objc dynamic var title: String? = ""
    @objc dynamic var descriptionn: String? = ""
    @objc dynamic var url: String? = ""
    @objc dynamic var urlToImage: String? = ""
    @objc dynamic var publishedAt: String? = ""
    @objc dynamic var content: String? = ""
    
    
    @objc dynamic var id = 0
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    override public class func primaryKey() -> String? {
        return "id"
    }
    
    public func mapping(map: Map){
        
        source <- map["source"]
        author <- map["author"]
        title <- map["title"]
        descriptionn <- map["description"]
        url <- map["url"]
        urlToImage <- map["urlToImage"]
        publishedAt <- map["publishedAt"]
        content <- map["content"]
        
        
        
    }
}
