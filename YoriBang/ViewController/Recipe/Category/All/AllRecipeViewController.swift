//
//  AllRecipeViewController.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/17.
//

import Foundation
import UIKit

class AllRecipeViewController: UIViewController {
    @IBOutlet weak var AllRecipeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    func configure() {
        
        // Set Navigation
        self.navigationItem.backBarButtonItem = UIBarButtonItem.BackButton()
        
        // Set TableView
        AllRecipeTableView.delegate = self
        AllRecipeTableView.dataSource = self
        AllRecipeTableView.rowHeight = UITableView.automaticDimension
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

extension AllRecipeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "RecipeDetailViewController") else {
            return
        }
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
}

extension AllRecipeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = AllRecipeTableView.dequeueReusableCell(withIdentifier: RecipeTableViewCell.identifier, for: indexPath) as? RecipeTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure()
        let background = UIView()
        background.backgroundColor = .clear
        cell.selectedBackgroundView = background
        return cell
        
    }
}
