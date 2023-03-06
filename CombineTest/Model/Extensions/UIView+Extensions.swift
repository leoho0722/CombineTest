//
//  UIView+Extensions.swift
//  CombineTest
//
//  Created by Leo Ho on 2023/3/6.
//

import UIKit

extension UIView {
    
    class func loadFromNib() -> UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
}
