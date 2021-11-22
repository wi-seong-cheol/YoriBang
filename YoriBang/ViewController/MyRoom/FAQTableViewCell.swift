//
//  FAQTableViewCell.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/19.
//

import Foundation
import UIKit

class FAQTableViewCell: UITableViewCell {
    static var identifier = "FAQTableViewCell"
    @IBOutlet weak var desc: UILabel!
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(_ desc: String) {
        self.desc.text = desc
    }
}
