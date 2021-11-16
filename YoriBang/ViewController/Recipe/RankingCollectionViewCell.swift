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
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure() {
        
        ContentView.layer.cornerRadius = 5
        ContentView.layer.masksToBounds = true
    }
}
