//
//  ApplicationError.swift
//  MVCSample
//
//  Created by Kay Zin Thaw on 23/06/2020.
//  Copyright © 2020 cbbank. All rights reserved.
//

import Foundation

class ApplicationError : NSError{
    var message:String{
        get{
            if(!self.localizedDescription.isEmpty){
                return self.localizedDescription;
            }
            else{
                return "Unknown Error";
            }
        }
        set{
            var info:Dictionary = self.userInfo as! Dictionary<String, String>;
            info[NSLocalizedDescriptionKey] = newValue;
        }
    };
    
    init(domain: String, code: Int, message: String) {
        let userInfo = [ NSLocalizedDescriptionKey : message];
        super.init(domain: domain, code: code, userInfo: userInfo);
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
}


