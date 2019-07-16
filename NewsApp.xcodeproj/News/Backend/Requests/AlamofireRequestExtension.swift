//
//  AlamofireRequestExtension.swift
//  NewsApp
//
//  Created by user on 7/15/19.
//  Copyright © 2019 MAF. All rights reserved.
//



import Alamofire


public extension Request {
    
    public func debugLog() -> Self {
        #if DEBUG
        debugPrint(self)
        #endif
        return self
    }
}

