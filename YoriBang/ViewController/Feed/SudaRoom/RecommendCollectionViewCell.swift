//
//  RecommendCollectionViewCell.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/16.
//

import Foundation
import UIKit

class RecommendCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var ContentView: UIView!
    @IBOutlet weak var RoomimageView: UIImageView!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var Comment: UILabel!
    @IBOutlet weak var Attention: UILabel!
    @IBOutlet weak var Content: UILabel!
    
    static let identifier = "RecommendCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        ContentView.layer.cornerRadius = 5
        ContentView.layer.masksToBounds = true
    }
    
    public func configure() {
    }
}
