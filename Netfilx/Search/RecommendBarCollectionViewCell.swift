//
//  RecommendBarCollectionViewCell.swift
//  Netfilx
//
//  Created by 은서우 on 2024/01/29.
//

import UIKit

class RecommendBarCollectionViewCell: UICollectionViewCell {
    
    let recommendBtn = UIButton()
    
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
        self.addSubview(recommendBtn)
    }
    
    func configureView() {
        recommendBtn.configuration = .customBtnStyle()
    }
    
    func setupContsraints() {
        recommendBtn.snp.makeConstraints { make in
            make.verticalEdges.equalTo(contentView)
        }
    }
    
    func setData(text: String, image: UIImage) {
        recommendBtn.configuration?.title = text
        recommendBtn.configuration?.image = image
    }
}
