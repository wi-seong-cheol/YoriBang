//
//  ProfileDiaryViewController.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/25.
//

import Foundation
import UIKit

class ProfileDiaryViewController: UIViewController {
    @IBOutlet weak var TableView: UITableView!
    
    var diary = [RecipeModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    func configure() {
        diary = GetData.shared.getRecipe()
        // Set TableView
        TableView.delegate = self
        TableView.dataSource = self
        
    }
}

//MARK: - UITableViewDelegate
extension ProfileDiaryViewController: UITableViewDelegate {
    
}

//MARK: - UITableViewDataSource
extension ProfileDiaryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diary.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = TableView.dequeueReusableCell(withIdentifier: ProfileDiaryTableViewCell.identifier, for: indexPath) as? ProfileDiaryTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(diary[indexPath.row])
        let background = UIView()
        background.backgroundColor = .clear
        cell.selectedBackgroundView = background
        return cell
    }
}
