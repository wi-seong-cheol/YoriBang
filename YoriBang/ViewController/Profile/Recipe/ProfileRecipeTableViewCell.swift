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
    
    func configure() {
        // Set View
        BackView.layer.borderWidth = 1
        BackView.layer.cornerRadius = 5
        BackView.layer.borderColor = UIColor(red: 251, green: 201, blue: 196).cgColor
        
        // Set Font
        TitleLabel.font = UIFont.NotoSansCJKkr(type: .medium, size: 103)
    }
}
