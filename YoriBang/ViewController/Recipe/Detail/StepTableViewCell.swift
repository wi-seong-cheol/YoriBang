//
//  StepTableViewCell.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/22.
//

import Foundation
import UIKit

class StepTableViewCell: UITableViewCell {
    static let identifier = "StepTableViewCell"
    @IBOutlet weak var BackView: UIView!
    @IBOutlet weak var Step: UILabel!
    @IBOutlet weak var Count: UILabel!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var Desc: UILabel!
    @IBOutlet weak var More: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure() {
        // Set Font
        Step.font = UIFont.Roboto(type: .medium, size: 12)
        Count.font = UIFont.Roboto(type: .medium, size: 12)
        TitleLabel.font = UIFont.NotoSansCJKkr(type: .medium, size: 12)
        BackView.layer.cornerRadius = 5
        BackView.layer.borderColor = UIColor(red: 237, green: 237, blue: 242).cgColor
        BackView.layer.borderWidth = 1
        Desc.font = UIFont.NotoSansCJKkr(type: .regular, size: 12)
    }
}
