//
//  RecipeContainer.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/07.
//

import Foundation
import UIKit

class RecipeContainer: UIViewController {
    @IBOutlet weak var RecipeTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        RecipeTableView.delegate = self
        RecipeTableView.dataSource = self
    }
    
    @IBAction func MoreBtn(_ sender: Any) {
        OKDialog("click")
    }
}

extension RecipeContainer: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "RecipeDetailViewController") else {
            return
        }
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
}

extension RecipeContainer: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = RecipeTableView.dequeueReusableCell(withIdentifier: RecipeTableViewCell.identifier, for: indexPath) as? RecipeTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: UIImage(), profile: UIImage(), title: "gg", nickname: "gg", time: "gg")
        return cell
    }
}
