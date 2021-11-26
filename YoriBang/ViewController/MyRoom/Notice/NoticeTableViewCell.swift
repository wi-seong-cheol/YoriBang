//
//  NoticeTableViewCell.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/26.
//

import Foundation
import UIKit

class NoticeTableViewCell: UITableViewCell {
    static var identifier = "NoticeTableViewCell"
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var Desc: UILabel!
    @IBOutlet weak var More: UIButton!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(_ desc: String, _ index: Int) {
        // Set Font
        TitleLabel.font = UIFont.Roboto(type: .medium, size: 16)
        Desc.font = UIFont.NotoSansCJKkr(type: .medium, size: 16)
        
        self.Desc.text = desc
    }
}
