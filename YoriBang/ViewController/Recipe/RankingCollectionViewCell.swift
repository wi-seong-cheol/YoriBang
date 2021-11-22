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
    
    @IBOutlet weak var ContentView: UIView!
    @IBOutlet weak var RankTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        RankTitle.font = UIFont.NotoSansCJKkr(type: .bold, size: 12)
        ContentView.layer.cornerRadius = 5
        ContentView.layer.masksToBounds = true
    }
    
    func configure() {
    }
}
