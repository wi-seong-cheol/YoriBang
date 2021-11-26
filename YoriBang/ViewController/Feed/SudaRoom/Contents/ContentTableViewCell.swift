//
//  ContentTableViewCell.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/16.
//

import Foundation
import UIKit

class ContentTableViewCell: UITableViewCell {
    static let identifier = "ContentTableViewCell"
    @IBOutlet weak var ContentView: UIView!
    @IBOutlet weak var Profile: UIImageView!
    @IBOutlet weak var Nickname: UILabel!
    @IBOutlet weak var Time: UILabel!
    @IBOutlet weak var Content: UILabel!
    @IBOutlet weak var Like: UILabel!
    @IBOutlet weak var Comment: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Set View
        ContentView.layer.cornerRadius = 3
        ContentView.layer.borderWidth = 1
        ContentView.layer.borderColor = UIColor(red: 253, green: 203, blue: 198).cgColor
        ContentView.layer.shadowOpacity = 0.16
        ContentView.layer.shadowRadius = 6
        ContentView.layer.masksToBounds = false
        ContentView.layer.shadowOffset = CGSize(width: 0, height: 3)
        Profile.layer.cornerRadius = Profile.frame.width/2
        Profile.layer.cornerRadius = Profile.frame.width/2
        Profile.layer.borderColor = UIColor(red: 229, green: 102, blue: 80).cgColor
        Profile.layer.cornerRadius = Profile.frame.width/2
        
        // Set Font
        Nickname.font = UIFont.Roboto(type: .regular, size: 10)
        Time.font = UIFont.NotoSansCJKkr(type: .regular, size: 8)
        Content.font = UIFont.NotoSansCJKkr(type: .regular, size: 12)
        Like.font = UIFont.NotoSansCJKkr(type: .regular, size: 8)
        Comment.font = UIFont.NotoSansCJKkr(type: .regular, size: 8)
    }
    
    public func configure() {
    }
}
