//
//  ContentsCollectionViewCell.swift
//  Netfilx
//
//  Created by 은서우 on 2024/01/26.
//

import UIKit

class ContentsCollectionViewCell: UICollectionViewCell {
    
    let testview = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureHierarchy()
        configureView()
        setupContsraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureHierarchy() {
        self.addSubview(testview)
    }
    
    func configureView() {
        testview.backgroundColor = .orange
    }
    
    func setupContsraints() {
        testview.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
