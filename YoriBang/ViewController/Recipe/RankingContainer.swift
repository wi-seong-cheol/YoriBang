//
//  RankingContainer.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/16.
//

import Foundation
import UIKit

class RankingContainer: UIViewController {
    @IBOutlet weak var RankingCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RankingCollectionView.delegate = self
        RankingCollectionView.dataSource = self
    }
}

extension RankingContainer: UICollectionViewDelegate {
    
}

extension RankingContainer: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = RankingCollectionView.dequeueReusableCell(withReuseIdentifier: RankingCollectionViewCell.identifier, for: indexPath) as? RankingCollectionViewCell else {
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
