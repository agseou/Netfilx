//
//  Observble.swift
//  Netfilx
//
//  Created by 은서우 on 2024/02/22.
//

import Foundation

// 관찰 가능한 대상
class Observable<T> {
    
    private var closure: ((T) -> Void)?
    
    var value: T {
        didSet {
            closure?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ closure: @escaping (T) -> Void) {
        print(#function)
        closure(value)
        self.closure = closure
    }
    
}
