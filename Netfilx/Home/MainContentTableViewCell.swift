//
//  MainContentTableViewCell.swift
//  Netfilx
//
//  Created by 은서우 on 2024/01/26.
//

import UIKit

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
        //posterImage.image = UIImage(named: poster.allCases.randomElement()!.rawValue)
        posterImage.contentMode = .scaleAspectFill
        posterImage.layer.cornerRadius = 15
    }
    
    func setupContsraints() {
        contentView.snp.makeConstraints { make in
            make.width.equalTo(UIScreen.main.bounds.width)
        }
        
        posterImage.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.horizontalEdges.equalTo(50)
        }
        
    }
    

}
