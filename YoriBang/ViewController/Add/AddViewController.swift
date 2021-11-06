//
//  AddViewController.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/05.
//

import Foundation
import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var AddBtnView: UIView!
    @IBOutlet weak var AddBackgroundView: UIView!
    @IBOutlet var AddItem: [UIButton]!
    @IBOutlet weak var AddBtn: UIButton!
    
    var AddState = false
    let shapeLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    func configure() {
        AddBtnSet(true, 1)
        AddBackgroundView.layer.cornerRadius = AddBackgroundView.frame.width / 2
        AddBackgroundView.clipsToBounds = true
        AddBackgroundView.layer.shadowRadius = AddBackgroundView.frame.width / 2
        AddBackgroundView.layer.shadowColor = UIColor.black.cgColor
        AddBackgroundView.layer.shadowOpacity = 0.3
        AddBackgroundView.layer.borderWidth = 0.1
        AddBackgroundView.layer.borderColor = UIColor(red: 253, green: 143, blue: 82).cgColor
        AddBackgroundView.backgroundColor = UIColor(red: 254, green: 139, blue: 88, a: 53)
    }
    
    func AddBtnSet(_ state: Bool, _ alpha: Int) {
        let currentState = state
        for addItemBtn in AddItem {
            addItemBtn.isHidden = currentState
            addItemBtn.alpha = 1
        }
    }
    
    @IBAction func AddBtn(_ sender: Any) {
        if AddState {
            AddBtn.setImage(UIImage(named: "add_orange_asset"), for: .normal)
            UIView.animate(withDuration: 0.25, animations: {
                self.AddBtnView.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 2)
                self.AddBackgroundView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                self.AddBtnSet(true, 1)
                self.AddState = false
            })
        } else {
                AddBtn.setImage(UIImage(named: "add_white_asset"), for: .normal)
            UIView.animate(withDuration: 0.25, animations: {
                self.AddBtnView.transform =  CGAffineTransform(rotationAngle: CGFloat.pi * (1/4))
                self.AddBackgroundView.transform = CGAffineTransform(scaleX: 5, y: 5)
                self.AddBtnSet(false, 0)
                self.AddState = true
            })
        }
    }
    
    @IBAction func JournalBtn(_ sender: Any) {
        print("dgdg")
    }
}
