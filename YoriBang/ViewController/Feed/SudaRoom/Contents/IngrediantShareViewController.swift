//
//  IngrediantShareViewController.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/16.
//

import UIKit

class IngrediantShareViewController: UIViewController {
    @IBOutlet weak var ContentTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ContentTableView.delegate = self
        ContentTableView.dataSource = self
    }
}

extension IngrediantShareViewController: UITableViewDelegate {

}

extension IngrediantShareViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = ContentTableView.dequeueReusableCell(withIdentifier: ContentTableViewCell.identifier, for: indexPath) as? ContentTableViewCell else {
            return UITableViewCell()
        }

        cell.configure()
        return cell
    }
}
