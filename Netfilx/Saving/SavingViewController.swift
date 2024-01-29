//
//  SavingViewController.swift
//  Netfilx
//
//  Created by 은서우 on 2024/01/26.
//

import UIKit

class SavingViewController: UIViewController {

    let dummyImage = UIImageView(image: UIImage(resource: .dummy))
    let noticeText = UILabel()
    let subnoticeText = UILabel()
    let settingBtn = UIButton()
    let contentsBnt =  UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        configureHierarchy()
        configureView()
        setupContsraints()
    }
    
    func configureHierarchy() {
        view.addSubview(dummyImage)
        view.addSubview(noticeText)
        view.addSubview(subnoticeText)
    }
    
    func configureView() {
        navigationItem.title = "저장한 콘텐츠 목록"
        
        noticeText.text = "'나만의 자동 저장' 기능"
        noticeText.textColor = .white
        noticeText.font = .boldSystemFont(ofSize: 17)
        
        subnoticeText.text = """
취향에 맞는 영화와 시리즈를 자동으로 저장해 드립니다.
디바이스에 언제나 시청할 콘텐츠가 준비되니 지루함 틈이
없어요.
"""
        subnoticeText.textColor = .white
        subnoticeText.font = .systemFont(ofSize: 14)
    }
    
    func setupContsraints() {
        noticeText.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(subnoticeText.snp.top)
        }
        subnoticeText.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(dummyImage.snp.top)
        }
        dummyImage.snp.makeConstraints { make in
            make.center.equalTo(view.safeAreaLayoutGuide)
        }
        
    }

}
