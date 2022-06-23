//
//  ProfileRecipeTableViewCell.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/25.
//

import Foundation
import UIKit

class ProfileRecipeTableViewCell: UITableViewCell {
    static let identifier = "ProfileRecipeTableViewCell"
    
    @IBOutlet weak var BackView: UIView!
    @IBOutlet weak var ThumbNail: UIImageView!
    @IBOutlet weak var TitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(_ recipe: RecipeModel) {
        // Set View
        BackView.layer.borderWidth = 1
        BackView.layer.cornerRadius = 5
        BackView.layer.borderColor = UIColor(red: 251, green: 201, blue: 196).cgColor
        ThumbNail.layer.cornerRadius = 5
        
        // Set Font
        TitleLabel.font = UIFont.NotoSansCJKkr(type: .medium, size: 10)
        
        let width = ThumbNail.frame.width
        let height = ThumbNail.frame.height
        ThumbNail.image = recipe.thumbNail.crop(rect: CGRect(x: 0, y: 0, width: width, height: height))
        TitleLabel.text = recipe.title
    }
}
