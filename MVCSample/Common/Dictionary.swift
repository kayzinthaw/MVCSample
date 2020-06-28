//
//  Dictionary.swift
//  MVCSample
//
//  Created by Kay Zin Thaw on 23/06/2020.
//  Copyright © 2020 cbbank. All rights reserved.
//

import Foundation

extension Dictionary {
    
    mutating func merge<K, V>(dictionaries: Dictionary<K, V>...) {
        for dict in dictionaries {
            for (key, value) in dict {
                self.updateValue(value as! Value, forKey: key as! Key)
            }
        }
    }
    
    func filter(predicate: (Element) -> Bool) -> Dictionary {
        var filteredDictionary = Dictionary()
        
        for (key, value) in self {
            if predicate((key:key, value:value)) {
                filteredDictionary[key] = value
            }
        }
        
        return filteredDictionary
    }
    
    func queryStringWithEncoding() -> String {
        var parts = [String]()
        
        for (key, value) in self {
            let keyString: String = "\(key)"
            let valueString: String = "\(value)"
            let query: String = "\(keyString)=\(valueString)"
            parts.append(query)
        }
        
        return parts.joined(separator: "&")
    }
    
}

infix operator +|
func +| <K,V>(left: Dictionary<K,V>, right: Dictionary<K,V>) -> Dictionary<K,V> {
    var map = Dictionary<K,V>()
    for (k, v) in left {
        map[k] = v
    }
    for (k, v) in right {
        map[k] = v
    }
    return map
}


