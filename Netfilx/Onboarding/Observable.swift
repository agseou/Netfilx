//
//  Observble.swift
//  Netfilx
//
//  Created by 은서우 on 2024/02/22.
//

import Foundation

// 관찰 가능한 대상
class Observable {
    
    private var closure: ((String) -> Void)?
    
    var text: String {
        didSet {
            closure?(text)
        }
    }
    
    init(_ text: String) {
        self.text = text
    }
    
    func bind(_ closure: @escaping (String) -> Void) {
        print(#function)
        closure(text)
        self.closure = closure
    }
    
}
