//
//  RecipeTableViewCell.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/15.
//

import UIKit

class NewRecipeTableViewCell: UITableViewCell {
    static let identifier = "NewRecipeTableViewCell"
    
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
    
    public func configure(with recipeModel: RecipeModel) {
        let height =  ThumbNail.frame.height
        let width = ThumbNail.frame.width
        self.ThumbNail.image = recipeModel.thumbNail.crop(rect: CGRect(x: 0, y: 0, width: width, height: height))
        self.TitleLabel.text = recipeModel.title
        self.Time.text = recipeModel.cookTime
        self.Profile.image = recipeModel.writer.profile
        self.Nickname.text = recipeModel.writer.nickName
    }
}
