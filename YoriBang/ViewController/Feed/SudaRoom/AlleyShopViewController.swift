//
//  AlleyShopViewController.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/16.
//

import UIKit

class AlleyViewController: UIViewController {
    @IBOutlet weak var RecommendCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RecommendCollectionView.delegate = self
        RecommendCollectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDelegate
extension AlleyViewController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource
extension AlleyViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = RecommendCollectionView.dequeueReusableCell(withReuseIdentifier: RecommendCollectionViewCell.identifier, for: indexPath) as? RecommendCollectionViewCell else {
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
