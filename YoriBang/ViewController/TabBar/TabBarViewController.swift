//
//  TabBarViewController.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/04.
//

import Foundation
import UIKit
import MaterialComponents.MaterialBottomSheet
import RAMAnimatedTabBarController

class TabBarViewController: UITabBarController {
    static var edit = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.delegate = self
    }
}

extension TabBarViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return TabBarViewController.edit
    }
}
