//
//  MainContentTableViewCell.swift
//  Netfilx
//
//  Created by 은서우 on 2024/01/26.
//

import UIKit
import SnapKit

class MainContentTableViewCell: UITableViewCell {
    
    let posterImage = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureHierarchy()
        configureView()
        setupContsraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHierarchy() {
        contentView.addSubview(posterImage)
    }
    
    func configureView() {
        posterImage.image = UIImage(named: poster.allCases.randomElement()!.rawValue)
        posterImage.contentMode = .scaleAspectFill
        posterImage.layer.cornerRadius = 15
    }
    
    func setupContsraints() {
        
        posterImage.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(contentView)
            make.leading.trailing.equalTo(50)
            make.top.bottom.equalTo(0)
        }
        
    }
    

}
