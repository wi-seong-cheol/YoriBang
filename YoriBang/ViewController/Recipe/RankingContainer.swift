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
    @IBOutlet weak var MonthRank: UIButton!
    @IBOutlet weak var DayRank: UIButton!
    @IBOutlet weak var More: UIButton!
    var rank = [RankModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    func configure() {
        rank = GetData.shared.getRank()
        
        // TableView Set
        RankingCollectionView.delegate = self
        RankingCollectionView.dataSource = self
        
        // Font Set
        MonthRank.titleLabel?.font = UIFont.NotoSansCJKkr(type: .bold, size: 14)
        DayRank.titleLabel?.font = UIFont.NotoSansCJKkr(type: .bold, size: 14)
        More.titleLabel?.font = UIFont.NotoSansCJKkr(type: .regular, size: 12)
    }
}

extension RankingContainer: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "RecipeDetailViewController") else {
            return
        }
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
}

extension RankingContainer: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rank.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = RankingCollectionView.dequeueReusableCell(withReuseIdentifier: RankingCollectionViewCell.identifier, for: indexPath) as? RankingCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(rank[indexPath.row])
        
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity =  0.16
        cell.layer.shadowRadius = 6
        cell.layer.masksToBounds = false
        cell.layer.shadowOffset = CGSize(width: 0, height: 3)
        return cell
    }
}
