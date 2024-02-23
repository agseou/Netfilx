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
    
    let tapGesture = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.isValidateLogin.bind { value in
            self.loginButton.isEnabled = value
        }
        
        // 키보드 올라감에 따른 화면 올리기
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        // 키보드 내려감에 따른 화면 내리기
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    override func configureHierarchy() {
        view.addSubview(stackView)
        view.addGestureRecognizer(tapGesture)
        stackView.addArrangedSubview(idTextField)
        stackView.addArrangedSubview(idNoticeLabel)
        stackView.addArrangedSubview(PWTextField)
        stackView.addArrangedSubview(PWNoticeLabel)
        stackView.addArrangedSubview(loginButton)
    }
    
    override func configureView() {
        tapGesture.cancelsTouchesInView = false
        tapGesture.addTarget(self, action: #selector(dismissKeyboard))
        
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
        idTextField.addTarget(self, action: #selector(editingTextField), for: .editingChanged)
        
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
        PWTextField.addTarget(self, action: #selector(editingTextField), for: .editingChanged)
        
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
        loginButton.addTarget(self, action: #selector(tapLoginButton), for: .touchUpInside)
        
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
    
    // 키보드 올릴때 화면 올리기
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let YPosition = self.loginButton.frame.size.height
            let offset = YPosition + 10
            if offset > 0 {
                self.view.frame.origin.y = -offset
            }
        }
    }
    
    // 키보드 내릴때 화면 내리기
    @objc func keyboardWillHide(notification: NSNotification) {
        self.view.frame.origin.y = 0
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func tapLoginButton() {
        let vc = HomeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @objc func editingTextField() {
        viewModel.IDText.value = idTextField.text!
        viewModel.PWText.value = PWTextField.text!
        
        // 감지될때마다 유효성을 검사하므로
        // 아이디와 비밀번호가 적절한지 알려주는 Label의 isHidden 상태도
        // 이 함수 안에서 결정함
        if !viewModel.isValidateID.value {
            idNoticeLabel.isHidden = false
            PWNoticeLabel.isHidden = true
        } else if !viewModel.isValidatePW.value {
            idNoticeLabel.isHidden = true
            PWNoticeLabel.isHidden = false
        } else {
            idNoticeLabel.isHidden = true
            PWNoticeLabel.isHidden = true
        }
        
        loginButton.isEnabled = viewModel.isValidateID.value && viewModel.isValidatePW.value
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == idTextField {
            PWTextField.becomeFirstResponder()
        } else if textField == PWTextField{
            if loginButton.isEnabled {
                tapLoginButton()
            }
        }
        return true
    }
    
}
