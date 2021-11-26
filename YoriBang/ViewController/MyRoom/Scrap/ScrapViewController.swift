//
//  ScrapViewController.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/27.
//

import Foundation
import UIKit

class ScrapViewController: UIViewController {
    @IBOutlet weak var TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    func configure() {
        
    }
}

//MARK: - UITableViewDelegate
extension ScrapViewController: UITableViewDelegate {
    
}

//MARK: - UITableViewDataSource
extension ScrapViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = TableView.dequeueReusableCell(withIdentifier: ScrapTableViewCell.identifier, for: indexPath) as? ScrapTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure()
        let background = UIView()
        background.backgroundColor = .clear
        cell.selectedBackgroundView = background
        return cell
    }
}
