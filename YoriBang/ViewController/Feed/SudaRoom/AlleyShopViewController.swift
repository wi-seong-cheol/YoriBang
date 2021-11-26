//
//  AlleyShopViewController.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/16.
//

import UIKit

class AlleyViewController: UIViewController {
    @IBOutlet weak var CollectionView: UICollectionView!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var SubTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    func configure() {
        // Set CollectionView
        CollectionView.delegate = self
        CollectionView.dataSource = self
        
        // Set Font
        TitleLabel.font = UIFont.NotoSansCJKkr(type: .bold, size: 16)
        SubTitle.font = UIFont.NotoSansCJKkr(type: .medium, size: 12)
    }
}

// MARK: - UICollectionViewDelegate
extension AlleyViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "AlleyShopDetailViewController") else {
            return
        }
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
}

// MARK: - UICollectionViewDataSource
extension AlleyViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = CollectionView.dequeueReusableCell(withReuseIdentifier: RecommendCollectionViewCell.identifier, for: indexPath) as? RecommendCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure()
        
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity =  0.16
        cell.layer.shadowRadius = 5
        cell.layer.masksToBounds = false
        cell.layer.shadowOffset = CGSize(width: 3, height: 3)
        return cell
    }
}
