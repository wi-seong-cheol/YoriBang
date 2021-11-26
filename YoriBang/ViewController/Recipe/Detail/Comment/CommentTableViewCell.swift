//
//  CommentTableViewCell.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/23.
//

import Foundation
import UIKit

class CommentTableViewCell: UITableViewCell {
    static let identifier = "CommentTableViewCell"
    
    @IBOutlet weak var ProfileView: UIView!
    @IBOutlet weak var Profile: UIImageView!
    @IBOutlet weak var Nickname: UILabel!
    @IBOutlet weak var BestComment: UILabel!
    @IBOutlet weak var BestCommentWidth: NSLayoutConstraint!
    @IBOutlet weak var Time: UILabel!
    
    @IBOutlet weak var Content: UILabel!
    @IBOutlet weak var Like: UIButton!
    @IBOutlet weak var Reply: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        ProfileView.layer.cornerRadius = ProfileView.frame.width/2
        Profile.layer.cornerRadius = Profile.layer.frame.width/2
        Nickname.font = UIFont.NotoSansCJKkr(type: .medium, size: 10)
        BestComment.font = UIFont.NotoSansCJKkr(type: .medium, size: 9)
        Time.font = UIFont.NotoSansCJKkr(type: .regular, size: 8)
        Content.font = UIFont.NotoSansCJKkr(type: .regular, size: 10)
        Like.titleLabel?.font = UIFont.NotoSansCJKkr(type: .regular, size: 9)
        Reply.titleLabel?.font = UIFont.NotoSansCJKkr(type: .regular, size: 9)
    }
    
    func configure() {
        
    }
}
