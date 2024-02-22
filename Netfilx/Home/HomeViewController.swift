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
        
        
    }
    
    func setupContsraints() {
        
    }
}
