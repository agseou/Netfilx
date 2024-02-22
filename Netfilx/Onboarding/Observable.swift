//
//  Observble.swift
//  Netfilx
//
//  Created by 은서우 on 2024/02/22.
//

import Foundation

class Observable {
    
    private var closure: (() -> Void)?
    
    var text: String {
        didSet {
    
        }
    }
    
    init(_ text: String) {
        self.text = text
    }
    
    func bind(_ clousure: @escaping (String) -> Void) {
        print(#function)
    }
    
}
