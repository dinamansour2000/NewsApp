//
//  SourceModel.swift
//  NewsApp
//
//  Created by user on 7/15/19.
//  Copyright © 2019 MAF. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift
import ObjectMapper_Realm

public class SourceModel: Object, Mappable {
    
    @objc dynamic var idNo: SourceModel?
    @objc dynamic var name: String? = ""
   
    
    
    @objc dynamic var id = 0
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    override public class func primaryKey() -> String? {
        return "id"
    }
    
    public func mapping(map: Map){
        
        idNo <- map["id"]
        name <- map["name"]
       
        
        
        
    }
}
