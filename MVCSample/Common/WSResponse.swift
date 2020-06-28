//
//  WSResponse.swift
//  MVCSample
//
//  Created by Kay Zin Thaw on 23/06/2020.
//  Copyright © 2020 cbbank. All rights reserved.
//

import Foundation
import EVReflection

class Meta: EVNetworkingObject {
    var resultCode: String!
    var resultDescription: String!
    var versionNo: String!
}

class WSResponse<T:NSObject>: EVNetworkingObject,EVGenericsKVC {
    var result: Meta?;
    var response:T?;
    var responseAsList:[T]?
    
    func setGenericValue(_ value: AnyObject!, forUndefinedKey key: String){
        
        switch key {
        case "response":
            response = value as? T
            if response == nil{
                responseAsList = value as? [T]
            }
            print("Response :: '\(response)'")
            print("Meta :: '\(result?.resultCode)'")
        
        default:
            print("---> setValue '\(value)' for key '\(key)' should be handled.")
        }
    }
    func getGenericType() -> NSObject{
        return T.init();
    }
    
    
}

