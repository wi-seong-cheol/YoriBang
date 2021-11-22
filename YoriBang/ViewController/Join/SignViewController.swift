//
//  LaunchViewController.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/21.
//

import Foundation
import UIKit

class SignViewController: UIViewController {
    @IBOutlet weak var subText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subText.font = UIFont.Gowun(size: 15)
    }
    
    @IBAction func Sign(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "JoinViewController")
        vc?.modalTransitionStyle = .coverVertical
        self.present(vc!, animated: true, completion: nil)
    }
}
