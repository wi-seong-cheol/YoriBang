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
    }
    
    public func configure(_ alley: AlleyShopModel) {
        ContentView.layer.cornerRadius = 5
        ContentView.layer.masksToBounds = true
        
        // Set Font
        TitleLabel.font = UIFont.NotoSansCJKkr(type: .medium, size: 12)
        Content.font = UIFont.NotoSansCJKkr(type: .medium, size: 10)
        Attention.font = UIFont.NotoSansCJKkr(type: .regular, size: 7)
        Comment.font = UIFont.NotoSansCJKkr(type: .regular, size: 7)
        
        let height = RoomimageView.frame.height
        let width = RoomimageView.frame.width
        RoomimageView.image = alley.thumbNail.crop(rect: CGRect(x: 0, y: 0, width: width, height: height))
        TitleLabel.text = alley.name
        Content.text = alley.desc
        Comment.text =  "리뷰 " + String(alley.review)
        Attention.text = "관심 " + String(alley.like)
    }
}
