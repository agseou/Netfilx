//
//  SearchViewController.swift
//  Netfilx
//
//  Created by 은서우 on 2024/01/26.
//

import UIKit

class SearchViewController: UIViewController {

    let searchBar = UISearchBar()
    let searchRecommendBar = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let noticeText = UILabel()
    let subnoticeText = UILabel()
    let recommendList = ["공개 예정", "모두의 인기콘텐츠", "Top 10 시리즈"]
    let imageLast = [UIImage(resource: .blue),UIImage(resource: .pink),UIImage(resource: .turquoise)]
    
    func layout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let width = 120
        let height = 50
        layout.itemSize = CGSize(width: width, height: height)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        return layout
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        configureHierarchy()
        configureView()
        setupContsraints()
    }
    
    func configureHierarchy() {
        view.addSubview(searchBar)
        view.addSubview(searchRecommendBar)
        view.addSubview(noticeText)
        view.addSubview(subnoticeText)
    }
    
    func configureView() {
        navigationItem.title = "NEW & HOT"
        
        searchBar.searchBarStyle = .minimal
        
        searchRecommendBar.register(RecommendBarCollectionViewCell.self, forCellWithReuseIdentifier: "RecommendBarCollectionViewCell")
        searchRecommendBar.delegate = self
        searchRecommendBar.dataSource = self
        searchRecommendBar.backgroundColor = .orange
        
        noticeText.text = "이런! 찾으시는 작품이 없습니다."
        noticeText.textColor = .white
        noticeText.font = .boldSystemFont(ofSize: 17)
        
        subnoticeText.text = "다른 영화 시리즈,배우,감독 또는 장르를 검색해보세요."
        subnoticeText.textColor = .white
        subnoticeText.font = .systemFont(ofSize: 14)
        
    }
    
    func setupContsraints() {
        searchBar.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
        searchRecommendBar.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(searchBar.snp.bottom)
            make.height.equalTo(50)
        }
        noticeText.snp.makeConstraints { make in
            make.center.equalTo(view.safeAreaLayoutGuide)
        }
        subnoticeText.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(noticeText.snp.bottom)
        }
    }

}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendBarCollectionViewCell", for: indexPath) as! RecommendBarCollectionViewCell
        
        cell.setData(text: recommendList[indexPath.row], image: UIImage(resource: .blue))
        
        return cell
    }
    
    
}

//#Preview {
//    SearchViewController()
//}
