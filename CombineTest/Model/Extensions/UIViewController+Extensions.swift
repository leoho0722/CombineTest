//
//  UIViewController+Extensions.swift
//  CombineTest
//
//  Created by Leo Ho on 2023/3/6.
//

import UIKit

extension UIViewController {
    
    /// 點空白處關鍵盤
    func dismissKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        tap.numberOfTapsRequired = 1
        view.addGestureRecognizer(tap)
    }
    
    @objc func closeKeyboard() {
        view.endEditing(true)
    }
}
