//
//  PostTableViewCell.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/24.
//

import Foundation
import UIKit

class PostTableViewCell: UITableViewCell {
    static let identifier = "PostTableViewCell"
    @IBOutlet weak var Profile: UIImageView!
    @IBOutlet weak var Nickname: UILabel!
    @IBOutlet weak var Location: UILabel!
    @IBOutlet weak var Time: UILabel!
    @IBOutlet weak var Desc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure() {
        // Set View
        Profile.layer.cornerRadius = Profile.frame.width/2
        
        // Set Font
        Nickname.font = UIFont.NotoSansCJKkr(type: .medium, size: 12)
        Desc.font = UIFont.NotoSansCJKkr(type: .regular, size: 12)
        Location.font = UIFont.NotoSansCJKkr(type: .regular, size: 10)
        Time.font = UIFont.NotoSansCJKkr(type: .regular, size: 10)
    }
}
