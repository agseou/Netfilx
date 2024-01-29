//
//  HomeViewController.swift
//  Netfilx
//
//  Created by 은서우 on 2024/01/26.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    let homeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    func layout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let width = 110
        let height = 150
        layout.itemSize = CGSize(width: width, height: height)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.scrollDirection = .horizontal
        return layout
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        
        configureHierarchy()
        configureView()
        setupContsraints()
    }
    
    func configureHierarchy() {
        view.addSubview(homeCollectionView)
    }
    
    func configureView() {
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        homeCollectionView.register(ContentsCollectionViewCell.self, forCellWithReuseIdentifier: "ContentsCollectionViewCell")
        
    }
    
    func setupContsraints() {
        homeCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContentsCollectionViewCell", for: indexPath) as! ContentsCollectionViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 150)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        // 헤더나 푸터 뷰를 반환
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TitleCollectionReusableView", for: indexPath) as! TitleCollectionReusableView
            // 헤더 구성
            headerView.titleLabel.text = "Section" // 섹션 타이틀 설정
            return headerView
        } else {
            return UICollectionReusableView()
        }
    }
    
}
