//
//  ContentsTableViewCell.swift
//  Netfilx
//
//  Created by 은서우 on 2024/01/26.
//

import UIKit
import SnapKit

class ContentsTableViewCell: UITableViewCell {
    
    let contentsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    func layout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width / 3.5
        let height = contentView.bounds.height
        layout.itemSize = CGSize(width: width, height: height)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.scrollDirection = .horizontal
        return layout
    }

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
        contentsCollectionView.delegate = self
        contentsCollectionView.dataSource = self
        contentView.addSubview(contentsCollectionView)
    }
    
    func configureView() {
        contentsCollectionView.register(ContentsCollectionViewCell.self, forCellWithReuseIdentifier: "ContentsCollectionViewCell")
        contentsCollectionView.collectionViewLayout = layout()
        contentsCollectionView.showsHorizontalScrollIndicator = false
    }
    
    func setupContsraints() {
        contentsCollectionView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
    
}

extension ContentsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContentsCollectionViewCell", for: indexPath) as! ContentsCollectionViewCell
        
        return cell
    }
}
