//
//  LoginViewController.swift
//  Netfilx
//
//  Created by 은서우 on 2024/02/22.
//

import UIKit
import SnapKit

class LoginViewController: BaseViewController {
    
    let viewModel = LoginViewModel()
    
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
    
    // isActiveLoginButton (로그인 버튼을 활성화 할지 결정하는 함수)
    @objc func isActiveLoginButton() {
        // isActive에 값을 받아서 결정함.
        let isActive = viewModel.validateID(idTextField.text) && viewModel.validatePW(PWTextField.text)
        
        // 감지될때마다 유효성을 검사하므로
        // 아이디와 비밀번호가 적절한지 알려주는 Label의 isHidden 상태도
        // 이 함수 안에서 결정함
        if !viewModel.validateID(idTextField.text) {
            idNoticeLabel.isHidden = false
            PWNoticeLabel.isHidden = true
        } else if !viewModel.validatePW(PWTextField.text) {
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
            if loginButton.isEnabled {
                let vc = HomeViewController()
                navigationController?.pushViewController(vc, animated: true)
            }
        }
        return true
    }

}
