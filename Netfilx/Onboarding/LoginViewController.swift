//
//  LoginViewController.swift
//  Netfilx
//
//  Created by 은서우 on 2024/02/22.
//

import UIKit
import SnapKit

class LoginViewController: BaseViewController {
    
    let stackView = UIStackView()
    let idTextField = UITextField()
    let idNoticeLabel = UILabel()
    let PWTextField = UITextField()
    let PWNoticeLabel = UILabel()
    let loginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func configureHierarchy() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(idTextField)
        stackView.addArrangedSubview(idNoticeLabel)
        stackView.addArrangedSubview(PWTextField)
        stackView.addArrangedSubview(PWNoticeLabel)
        stackView.addArrangedSubview(loginButton)
    }
    
    override func configureView() {
        // StackView
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        
        // ID TextField
        idTextField.delegate = self
        idTextField.textColor = .white
        idTextField.backgroundColor = .systemGray
        idTextField.returnKeyType = .next
        idTextField.keyboardType = .emailAddress
        idTextField.placeholder = "이메일 주소 또는 전화번호"
        idTextField.addTarget(self, action: #selector(isActiveLoginButton), for: .editingChanged)
        
        // idNoticeLabel
        idNoticeLabel.text = "올바른 이메일을 입력하세요"
        idNoticeLabel.isHidden = true
        
        // PassWord TextField
        PWTextField.delegate = self
        PWTextField.textColor = .white
        PWTextField.backgroundColor = .systemGray
        PWTextField.returnKeyType = .go
        PWTextField.keyboardType = .asciiCapable
        PWTextField.placeholder = "비밀번호"
        PWTextField.addTarget(self, action: #selector(isActiveLoginButton), for: .editingChanged)
        
        // PWNoticeLabel
        PWNoticeLabel.text = "영문+숫자 8자리이상 올바른 비밀번호를 입력하세요."
        PWNoticeLabel.isHidden = true
        
        // Login Button
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .systemRed
        config.title = "로그인"
        config.baseForegroundColor = .white
        loginButton.configuration = config
        loginButton.isEnabled = false //초기 버튼 비활성화
        
    }
    
    override func configureConstraints() {
        stackView.snp.makeConstraints {
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(30)
            $0.centerY.equalTo(view.safeAreaLayoutGuide)
        }
        [idTextField, PWTextField].forEach {
            $0.snp.makeConstraints {
                $0.height.equalTo(40)
            }
        }
    }
    
    func validateID(_ text: String?) -> Bool {
        // 1. 빈값
        guard let text = text, !text.isEmpty else { return false }
        
        // 2. 이메일 주소가 맞는지
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", regex)
        let isValid = emailPredicate.evaluate(with: text)
        
        return isValid
    }
    
    func validatePW(_ text: String?) -> Bool {
        // 1. 빈값
        guard let text = text, !text.isEmpty else { return false }
        
        // 2. 패스워드가 유효한지
        let regex = "^(?=.*\\d)(?=.*[A-Za-z])[A-Za-z\\d]{8,25}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        let isValid = predicate.evaluate(with: text)
        
        return isValid
    }
    
    @objc func isActiveLoginButton() {
        let isActive = validateID(idTextField.text) && validatePW(PWTextField.text)
        if !validateID(idTextField.text) {
            idNoticeLabel.isHidden = false
            PWNoticeLabel.isHidden = true
        } else if !validatePW(PWTextField.text) {
            idNoticeLabel.isHidden = true
            PWNoticeLabel.isHidden = false
        } else {
            idNoticeLabel.isHidden = true
            PWNoticeLabel.isHidden = true
        }
        loginButton.isEnabled = isActive
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == idTextField {
            PWTextField.becomeFirstResponder()
        } else if textField == PWTextField{
            isActiveLoginButton()
        }
        return true
    }

}
