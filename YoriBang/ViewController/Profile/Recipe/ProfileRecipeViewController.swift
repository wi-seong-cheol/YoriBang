//
//  ProfileRecipeViewController.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/25.
//

import Foundation
import UIKit

class ProfileRecipeViewController: UIViewController {
    @IBOutlet weak var TableView: UITableView!
    var recipe = [RecipeModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    func configure() {
        recipe = GetData.shared.getRecipe()
        // Set TableView
        TableView.delegate = self
        TableView.dataSource = self
        
    }
}

//MARK: - UITableViewDelegate
extension ProfileRecipeViewController: UITableViewDelegate {
    
}

//MARK: - UITableViewDataSource
extension ProfileRecipeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipe.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = TableView.dequeueReusableCell(withIdentifier: ProfileRecipeTableViewCell.identifier, for: indexPath) as? ProfileRecipeTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(recipe[indexPath.row])
        let background = UIView()
        background.backgroundColor = .clear
        cell.selectedBackgroundView = background
        return cell
    }
}
