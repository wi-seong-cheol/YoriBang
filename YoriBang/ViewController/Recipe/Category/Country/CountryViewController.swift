//
//  ContryViewController.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/22.
//

import Foundation
import UIKit

class CountryViewController: UIViewController {
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet var Category: [UIButton]!
    @IBOutlet weak var ClickView: UIView!
    @IBOutlet weak var ClickVIewPosition: NSLayoutConstraint!
    @IBOutlet weak var ClickViewWidth: NSLayoutConstraint!
    
    var didClickCategory = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.tabBarController?.tabBar.isHidden = true
        configure()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func configure() {
        // Set Navigation
        self.navigationItem.backBarButtonItem = UIBarButtonItem.BackButton()
        
        // Set TableView
        TableView.delegate = self
        TableView.dataSource = self
        TableView.rowHeight = UITableView.automaticDimension
        
        // Set Font
        for label in Category {
            label.titleLabel?.font = UIFont.NotoSansCJKkr(type: .bold, size: 12)
            label.titleLabel?.textColor = UIColor(red: 127, green: 127, blue: 127)
        }
        
        // Set View
        ClickView.layer.cornerRadius = 10
    }
    
    @IBAction func ClickCategory(_ sender: UIButton) {
        
        DispatchQueue.main.async {
            
//            self.Category[sender.tag].titleLabel?.textColor = UIColor(red: 127, green: 127, blue: 127)
//            self.didClickCategory = sender.tag
            self.ClickViewWidth.constant = CGFloat((sender.titleLabel?.text!.count)!*11) + 23
            self.ClickView.center.x = sender.center.x
            //        Position.constant = position
//            sender.titleLabel?.textColor = .white
//            self.Category[sender.tag].titleLabel?.textColor = UIColor(red: 127, green: 127, blue: 127)
//            self.didClickCategory = sender.tag
//            self.ClickVIewPosition.constant = sender.center.x
//            sender.titleLabel?.textColor = .white
        }
//        switch sender.tag {
//        case 0:
//            break
//        case 1:
//            break
//        case 2:
//            break
//        case 3:
//            break
//        case 4:
//            break
//        case 5:
//            break
//        default:
//            break
//        }
        
    }
}

extension CountryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "RecipeDetailViewController") else {
            return
        }
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
}

extension CountryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = TableView.dequeueReusableCell(withIdentifier: RecipeTableViewCell.identifier, for: indexPath) as? RecipeTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure()
        let background = UIView()
        background.backgroundColor = .clear
        cell.selectedBackgroundView = background
        return cell
        
    }
}
