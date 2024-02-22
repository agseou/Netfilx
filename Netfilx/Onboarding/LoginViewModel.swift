//
//  LoginViewModel.swift
//  Netfilx
//
//  Created by 은서우 on 2024/02/22.
//

import Foundation

// [ 기본 개념 ]
// View는 ViewModel의 변화를 감지할 때마다 이를 반영해야함.
// ViewModel <- observable  |   View <- ViewModel

// 1. TextField에서는 값의 변화가 생길때, "로그인 버튼을 활성화할지 (-> func isActiveLoginButton)" 검사한다.
// 2. 기능을 어떻게 분리해야할지???
class LoginViewModel {
    
    // 텍스트필드에서 "입력 값"을 받는 프로퍼티
    var inputText = Observable("")
    
    // 검사 유효성을 반환해주면 좋겠음 -> Bool 값?
    //var outputResult = Observable("")
    
    // ID 검사 function
    func validateID(_ text: String?) -> Bool {
        // 1. 빈값
        guard let text = text, !text.isEmpty else { return false }
        
        // 2. 이메일 주소가 맞는지
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", regex)
        let isValid = emailPredicate.evaluate(with: text)
        
        return isValid
    }
    
    // PW 검사 function
    func validatePW(_ text: String?) -> Bool {
        // 1. 빈값
        guard let text = text, !text.isEmpty else { return false }
        
        // 2. 패스워드가 유효한지
        let regex = "^(?=.*\\d)(?=.*[A-Za-z])[A-Za-z\\d]{8,25}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        let isValid = predicate.evaluate(with: text)
        
        return isValid
    }
   
}
    
