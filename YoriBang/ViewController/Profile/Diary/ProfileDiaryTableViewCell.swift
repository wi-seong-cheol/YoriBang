//
//  ProfileDiaryTableViewCell.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/25.
//

import Foundation
import UIKit

class ProfileDiaryTableViewCell: UITableViewCell {
    static let identifier = "ProfileDiaryTableViewCell"
    
    @IBOutlet weak var BackView: UIView!
    @IBOutlet weak var ThumbNail: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(_ diary: RecipeModel) {
        // Set View
        BackView.layer.borderWidth = 1
        BackView.layer.cornerRadius = 5
        BackView.layer.borderColor = UIColor(red: 251, green: 201, blue: 196).cgColor
        ThumbNail.layer.cornerRadius = 5
        
        let width = ThumbNail.frame.width
        let height = ThumbNail.frame.height
        ThumbNail.image = diary.thumbNail.crop(rect: CGRect(x: 0, y: 0, width: width, height: height))
    }
}
