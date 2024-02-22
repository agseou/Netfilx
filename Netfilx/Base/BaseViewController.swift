//
//  BaseViewController.swift
//  Netfilx
//
//  Created by 은서우 on 2024/02/22.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        configureView()
        configureConstraints()
    }
    
    func configureHierarchy() { }
    func configureView() { }
    func configureConstraints() { }

}
