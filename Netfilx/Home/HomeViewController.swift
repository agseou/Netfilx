//
//  HomeViewController.swift
//  Netfilx
//
//  Created by 은서우 on 2024/01/26.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    let homeTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        
        configureHierarchy()
        configureView()
        setupContsraints()
    }
    
    func configureHierarchy() {
        view.addSubview(homeTableView)
    }
    
    func configureView() {
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.rowHeight = UIScreen.main.bounds.height / 3
        homeTableView.register(ContentsTableViewCell.self, forCellReuseIdentifier: "ContentsTableViewCell")
        homeTableView.register(MainContentTableViewCell.self, forCellReuseIdentifier: "MainContentTableViewCell")
    }
    
    func setupContsraints() {
        homeTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.section == 0 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "MainContentTableViewCell", for: indexPath) as! MainContentTableViewCell
//            
//            return cell
//        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ContentsTableViewCell", for: indexPath) as! ContentsTableViewCell
            
            return cell
//        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return nil
        } else {
            return "tableCell"
        }
    }
    
}
