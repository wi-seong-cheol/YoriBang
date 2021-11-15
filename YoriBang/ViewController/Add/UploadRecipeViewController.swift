//
//  UploadRecipeViewController.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/15.
//

import Foundation
import UIKit
import MaterialComponents.MaterialBottomSheet

class UploadRecipeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func configure() {
        
    }
    
    @IBAction func ingrediantSearch(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "IngrediantSearchViewController") as! IngrediantSearchViewController
                
        let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: vc)
        bottomSheet.mdc_bottomSheetPresentationController?.preferredSheetHeight = 200
                
        present(bottomSheet, animated: true, completion: nil)
    }
    
}
