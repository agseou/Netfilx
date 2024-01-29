//
//  UIButton+Extension.swift
//  Netfilx
//
//  Created by 은서우 on 2024/01/29.
//

import UIKit

extension UIButton.Configuration {
    
    static func customBtnStyle() -> UIButton.Configuration {
        
        var config = UIButton.Configuration.filled()
        config.title = "Title"
        config.baseForegroundColor = .white
        config.baseBackgroundColor = .black
        config.imagePlacement = .leading
        return config
    }
    
    
}
