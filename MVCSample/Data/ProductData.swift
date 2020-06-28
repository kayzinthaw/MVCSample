//
//  ProductData.swift
//  MVCSample
//
//  Created by Kay Zin Thaw on 23/06/2020.
//  Copyright © 2020 cbbank. All rights reserved.
//

import Foundation
import UIKit
class ProductData {
    
    static func getAllProduct() -> [ProductModel]{
        var arrData = [ProductModel]()
        arrData = [
            ProductModel(image: #imageLiteral(resourceName: "hot_hands"), title: "Image1"),
            ProductModel(image: #imageLiteral(resourceName: "profile"), title: "Image2"),
            ProductModel(image: #imageLiteral(resourceName: "tha"), title: "Image3"),
            ProductModel(image: #imageLiteral(resourceName: "men"), title: "Image4"),
            ProductModel(image: #imageLiteral(resourceName: "thailand"), title: "Image5"),
            ProductModel(image: #imageLiteral(resourceName: "hot_hands"), title: "Image6"),
            ProductModel(image: #imageLiteral(resourceName: "thailand"), title: "Image7"),
            ProductModel(image: #imageLiteral(resourceName: "tha"), title: "Image8"),
            ProductModel(image: #imageLiteral(resourceName: "men"), title: "Image9"),
        ]
        
        return arrData
    }
}



