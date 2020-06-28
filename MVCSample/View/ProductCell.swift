//
//  ProductCell.swift
//  MVCSample
//
//  Created by May Phoo on 23/06/2020.
//  Copyright © 2020 cbbank. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var productData: ProductModel?{
        didSet{
            imageView.image = productData?.image
            label.text = productData?.title// testing git
        }
    }
}
extension UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}
