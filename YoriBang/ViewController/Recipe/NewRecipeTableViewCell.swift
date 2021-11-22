//
//  RecipeTableViewCell.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/15.
//

import UIKit

class NewRecipeTableViewCell: UITableViewCell {
    static let identifier = "RecipeTableViewCell"
    
    @IBOutlet weak var ShadowView: UIView!
    @IBOutlet weak var RecipeView: UIView!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var Nickname: UILabel!
    @IBOutlet weak var Time: UILabel!
    @IBOutlet weak var ThumbNail: UIImageView!
    @IBOutlet weak var Profile: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        RecipeView.layer.cornerRadius = 5
        RecipeView.layer.masksToBounds = true
        TitleLabel.font = UIFont.NotoSansCJKkr(type: .bold, size: 16)
        Nickname.font = UIFont.Roboto(type: .regular, size: 10)
        ShadowView.layer.cornerRadius = 5
        ShadowView.layer.shadowColor = UIColor.black.cgColor
        ShadowView.layer.shadowOpacity =  0.16
        ShadowView.layer.shadowRadius = 6
        ShadowView.layer.masksToBounds = false
        ShadowView.layer.shadowOffset = CGSize(width: 0, height: 3)
        Profile.layer.cornerRadius = Profile.frame.width/2
    }
    
    public func configure(with thumbnail: UIImage, profile: UIImage, title: String, nickname: String, time: String) {
        self.TitleLabel.text = title
        self.Nickname.text = nickname
        self.Time.text = time
        
    }
}
