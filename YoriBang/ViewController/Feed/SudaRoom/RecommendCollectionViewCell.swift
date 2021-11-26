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
    
    public func configure() {
        ContentView.layer.cornerRadius = 5
        ContentView.layer.masksToBounds = true
        
        // Set Font
        TitleLabel.font = UIFont.NotoSansCJKkr(type: .medium, size: 12)
        Content.font = UIFont.NotoSansCJKkr(type: .medium, size: 10)
        Attention.font = UIFont.NotoSansCJKkr(type: .regular, size: 7)
        Comment.font = UIFont.NotoSansCJKkr(type: .regular, size: 7)
        
    }
}
