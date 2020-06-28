//
//  ApplicationData.swift
//  MVCSample
//
//  Created by Kay Zin Thaw on 23/06/2020.
//  Copyright © 2020 cbbank. All rights reserved.
//

import Foundation

class ApplicationData: NSObject {
    var username: String?
    
    override init() {
        super.init();
        self.unarchiveusername()
    }
    
    func archiveusername() {
        if(self.username != nil) {
            NSKeyedArchiver.archiveRootObject(self.username, toFile: makeDocumentPath(filename:"username.dat"))
        }
    }
    func unarchiveusername(){
           if let username = NSKeyedUnarchiver.unarchiveObject(withFile: makeDocumentPath(filename: "username.dat")) as? String{
               self.username = username;
           }
       }
}
