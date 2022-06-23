//
//  RankingCollectionViewCell.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/16.
//

import Foundation
import UIKit

class RankingCollectionViewCell: UICollectionViewCell {
    static var identifier = "RankingCollectionViewCell"
    
    @IBOutlet weak var Rank: UILabel!
    @IBOutlet weak var ContentView: UIView!
    @IBOutlet weak var RankTitle: UILabel!
    @IBOutlet weak var ThumbNail: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        RankTitle.font = UIFont.NotoSansCJKkr(type: .bold, size: 12)
        Rank.font = UIFont.NotoSansCJKkr(type: .medium, size: 12)
        
        ContentView.layer.cornerRadius = 5
        ContentView.layer.masksToBounds = true
    }
    
    func configure(_ rankModel: RankModel) {
        ThumbNail.image = rankModel.thumbNail
        Rank.text = String(rankModel.rank)
        RankTitle.text = rankModel.title
    }
}
