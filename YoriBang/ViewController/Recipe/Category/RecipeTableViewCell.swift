//
//  AllRecipeTableViewCell.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/17.
//

import Foundation
import UIKit

class RecipeTableViewCell: UITableViewCell {
    
    public static var identifier = "RecipeTableViewCell"
    @IBOutlet weak var ThumbNail: UIImageView!
    @IBOutlet weak var TitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ThumbNail.layer.cornerRadius = 5
        ThumbNail.layer.borderWidth = 1
        ThumbNail.layer.borderColor = UIColor(red: 243, green: 203, blue: 198).cgColor
        TitleLabel.font = UIFont.NotoSansCJKkr(type: .bold, size: 16)
    }
    
    func configure() {
        
    }
}
