//
//  ContentsCollectionViewCell.swift
//  Netfilx
//
//  Created by 은서우 on 2024/01/26.
//

import UIKit
import SnapKit

class ContentsCollectionViewCell: UICollectionViewCell {
    
    let posterImage = UIImageView()
    
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
        self.addSubview(posterImage)
    }
    
    func configureView() {
        posterImage.backgroundColor = .orange
        posterImage.image = UIImage(named: poster.allCases.randomElement()!.rawValue)
        posterImage.contentMode = .scaleAspectFill
        posterImage.layer.cornerRadius = 10
    }
    
    func setupContsraints() {
        posterImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
