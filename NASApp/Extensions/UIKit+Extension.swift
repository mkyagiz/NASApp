//
//  UIKit+Extension.swift
//  NASApp
//
//  Created by M.Kasim Yagiz on 3.03.2021.
//

import UIKit
extension UILabel{
    convenience init(text: String){
        self.init()
        self.text = text
    }
    convenience init(text: String, fontSize: CGFloat){
        self.init()
        self.text = text
        self.font = UIFont.boldSystemFont(ofSize: fontSize)
    }
}
