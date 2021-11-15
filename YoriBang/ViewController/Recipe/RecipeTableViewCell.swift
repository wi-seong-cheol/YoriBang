//
//  RecipeTableViewCell.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/15.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {
    static let identifier = "RecipeTableViewCell"
    
    @IBOutlet weak var recipeView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nickname: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var thumbNail: UIImageView!
    @IBOutlet weak var profile: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        recipeView.layer.cornerRadius = 5
        titleLabel.font = UIFont.NotoSansCJKkr(type: .bold, size: 16)
        nickname.font = UIFont.Roboto(type: .regular, size: 10)
    }
    
    public func configure(with thumbnail: UIImage, profile: UIImage, title: String, nickname: String, time: String) {
        self.titleLabel.text = title
        self.nickname.text = nickname
        self.time.text = time
        
    }
}
