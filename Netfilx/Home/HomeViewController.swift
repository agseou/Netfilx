//
//  HomeViewController.swift
//  Netfilx
//
//  Created by 은서우 on 2024/01/26.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    let posterImage = UIImageView()
    let navigationBar = UINavigationBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureView()
        setupContsraints()
    }
    func configureHierarchy() {
        view.addSubview(navigationBar)
        view.addSubview(posterImage)
    }
    
    func configureView() {
        posterImage.image = UIImage(resource: .서울의봄)
    }
    
    func setupContsraints() {
        
        posterImage.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.size.equalTo(200)
        }
    }
}


#Preview {
    HomeViewController()
}
