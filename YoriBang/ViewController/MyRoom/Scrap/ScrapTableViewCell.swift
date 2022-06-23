//
//  ScrapTableViewCell.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/27.
//

import Foundation
import UIKit

class ScrapTableViewCell: UITableViewCell {
    static let identifier = "ScrapTableViewCell"
    
    @IBOutlet weak var ThumbNail: UIImageView!
    @IBOutlet weak var Profile: UIImageView!
    @IBOutlet weak var Nickname: UILabel!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var Desc: UILabel!
    
    var roomId: String?
    weak var delegate: ScrapTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure() {
        // Set Font
    }
    
    @IBAction func scrapButtonTapped(_ sender: UIButton){
        if let roomId = roomId {
            self.delegate?.scrapTableViewCell(self, detailButtonTappedFor: roomId)
        }
    }
}


protocol ScrapTableViewCellDelegate: AnyObject {
    func scrapTableViewCell(_ scrapTableViewCell: ScrapTableViewCell, detailButtonTappedFor roomId: String)
}
