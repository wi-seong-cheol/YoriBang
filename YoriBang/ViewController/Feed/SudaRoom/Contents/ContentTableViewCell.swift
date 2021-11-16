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
    @IBOutlet weak var Like: UIButton!
    @IBOutlet weak var Comment: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        ContentView.layer.cornerRadius = 11
        ContentView.layer.borderWidth = 1
        ContentView.layer.borderColor = UIColor(red: 251, green: 201, blue: 196).cgColor
        ContentView.layer.shadowOpacity = 0.16
        ContentView.layer.shadowRadius = 6
        ContentView.layer.masksToBounds = false
        ContentView.layer.shadowOffset = CGSize(width: 0, height: 3)
        Profile.layer.cornerRadius = Profile.frame.width/2
        Nickname.font = UIFont.Roboto(type: .regular, size: 10)
        Time.font = UIFont.NotoSansCJKkr(type: .regular, size: 8)
        Content.font = UIFont.NotoSansCJKkr(type: .regular, size: 12)
        Like.titleLabel?.font = UIFont.NotoSansCJKkr(type: .regular, size: 8)
        Comment.titleLabel?.font = UIFont.NotoSansCJKkr(type: .regular, size: 8)
    }
    
    public func configure() {
    }
}
