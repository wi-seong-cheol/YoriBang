//
//  FAQViewController.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/19.
//

import Foundation
import UIKit

class FAQViewController: UIViewController {
    
    @IBOutlet weak var TableView: UITableView!
    var clickCell = 0
    var isTapped: Bool = false
    var selectedCellPath: IndexPath?
    
    let durmy = ["Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,","Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard it to make a type specimen book. It has survived not only five centuries,","Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,","Lorem Ipsum is simply dummy tex make a type specimen book. It has survived not only five centuries,","Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,","Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func updateUI() {
        DispatchQueue.main.async {
            self.TableView.reloadData()
        }
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
        TableView.dataSource = self
        TableView.delegate = self
        
        TableView.rowHeight = UITableView.automaticDimension
        TableView.estimatedRowHeight = 90
    }
    
}

extension FAQViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if (selectedCellPath != nil && indexPath.row != selectedCellPath!.row) || selectedCellPath == nil {
            isTapped = true
        } else if (selectedCellPath != nil && indexPath.row == selectedCellPath!.row) {
            if let cell = TableView.cellForRow(at: selectedCellPath!) as? FAQTableViewCell {
                if cell.Desc.numberOfLines == 0 {
                    isTapped = false
                } else {
                    isTapped = true
                }
            }
        }
        
        tableView.reloadRows(at: [indexPath], with: .none)
        tableView.selectRow(at: indexPath, animated: true, scrollPosition: .middle)
        
        isTapped = false
        if selectedCellPath != nil && indexPath.row != selectedCellPath!.row {
            tableView.reloadRows(at: [selectedCellPath!], with: .none)
            tableView.selectRow(at: selectedCellPath!, animated: true, scrollPosition: .middle)
        }
        
        selectedCellPath = indexPath
    }
}

extension FAQViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return durmy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = TableView.dequeueReusableCell(withIdentifier: FAQTableViewCell.identifier, for: indexPath) as? FAQTableViewCell else {
            return UITableViewCell()
        }
        if isTapped {
            cell.Desc.numberOfLines = 0
            UIView.animate(withDuration: 0.25, animations: {
                cell.More.transform = CGAffineTransform(rotationAngle: CGFloat.pi*2)
            })
        } else {
            cell.Desc.numberOfLines = 1
            UIView.animate(withDuration: 0.25, animations: {
                cell.More.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            })
        }
        cell.configure(durmy[indexPath.row], indexPath.row)
        let background = UIView()
        background.backgroundColor = .clear
        cell.selectedBackgroundView = background
        return cell
    }
}
