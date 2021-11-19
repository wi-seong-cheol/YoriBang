//
//  MyRoomTableViewController.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/19.
//

import Foundation
import UIKit

class MyRoomTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let MyRoomTableViewController = self.parent as? MyRoomViewController {
            MyRoomTableViewController.performSegue(withIdentifier: "AlleyRadiusVC", sender: indexPath.row)
        }
    }
}
