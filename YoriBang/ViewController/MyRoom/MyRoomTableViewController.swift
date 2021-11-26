//
//  MyRoomTableViewController.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/19.
//

import Foundation
import UIKit

class MyRoomTableViewController: UITableViewController {
    @IBOutlet weak var AlleyRadius: UILabel!
    @IBOutlet weak var Scrap: UILabel!
    @IBOutlet weak var Like: UILabel!
    @IBOutlet weak var FAQ: UILabel!
    @IBOutlet weak var Notice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    func configure() {
        AlleyRadius.font = UIFont.NotoSansCJKkr(type: .regular, size: 14)
        Scrap.font = UIFont.NotoSansCJKkr(type: .regular, size: 14)
        Like.font = UIFont.NotoSansCJKkr(type: .regular, size: 14)
        FAQ.font = UIFont.NotoSansCJKkr(type: .regular, size: 14)
        Notice.font = UIFont.NotoSansCJKkr(type: .regular, size: 14)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let MyRoomTableViewController = self.parent as? MyRoomViewController {
            switch indexPath.row {
            case 0:
                MyRoomTableViewController.performSegue(withIdentifier: "AlleyRadiusVC", sender: indexPath.row)
            case 3:
                MyRoomTableViewController.performSegue(withIdentifier: "faqVC", sender: indexPath.row)
            case 4:
                MyRoomTableViewController.performSegue(withIdentifier: "noticeVC", sender: indexPath.row)
            default:
                return
            }
        }
    }
}
