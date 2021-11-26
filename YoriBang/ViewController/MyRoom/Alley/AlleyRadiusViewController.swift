//
//  AlleyRadiusViewController.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/19.
//

import Foundation
import UIKit

class AlleyRadiusViewController: UIViewController {
    
    @IBOutlet weak var Desc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    func configure() {
        // Set Font
        Desc.font = UIFont.NotoSansCJKkr(type: .medium, size: 14)
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
}

extension AlleyRadiusViewController: UITableViewDelegate {
    
}

extension AlleyRadiusViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = TableView.dequeueReusableCell(withIdentifier: FAQTableViewCell.identifier, for: indexPath) as? FAQTableViewCell else {
//            return UITableViewCell()
//        }
//
//        cell.configure(durmy[indexPath.row], indexPath.row)
//        cell.delegate = self
//        let background = UIView()
//        background.backgroundColor = .clear
//        cell.selectedBackgroundView = background
        return UITableViewCell()
    }
    
    
}
