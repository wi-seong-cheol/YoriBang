//
//  PostDetailViewController.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/24.
//

import Foundation
import UIKit

class PostDetailViewController: UIViewController {
    @IBOutlet weak var CollectionView: UICollectionView!
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var Profile: UIImageView!
    @IBOutlet weak var Nickname: UILabel!
    @IBOutlet weak var Desc: UILabel!
    @IBOutlet weak var Location: UILabel!
    @IBOutlet weak var Time: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func configure() {
        // Set TableView
        TableView.delegate = self
        TableView.dataSource = self
        TableView.rowHeight = UITableView.automaticDimension
        
        // Set CollectionView
        CollectionView.delegate = self
        CollectionView.dataSource = self
        
        // Set View
        Profile.layer.cornerRadius = Profile.frame.width/2
        // Set Font
        Nickname.font = UIFont.NotoSansCJKkr(type: .medium, size: 12)
        Desc.font = UIFont.NotoSansCJKkr(type: .regular, size: 12)
        Location.font = UIFont.NotoSansCJKkr(type: .regular, size: 10)
        Time.font = UIFont.NotoSansCJKkr(type: .regular, size: 10)
    }
    
}

//MARK: - CollectionView Dellegate
extension PostDetailViewController: UICollectionViewDelegate {
    
}

//MARK: - CollectionView DataSource
extension PostDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = CollectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.identifier, for: indexPath) as? PostCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure()
        
        return cell
    }
    
    
}

//MARK: - TablenView Dellegate
extension PostDetailViewController: UITableViewDelegate {
    
}

//MARK: - TableView DataSource
extension PostDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = TableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as? PostTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure()
        let background = UIView()
        background.backgroundColor = .clear
        cell.selectedBackgroundView = background
        return cell
    }
    
    
}
