//
//  ReviewViewController.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/23.
//

import Foundation
import UIKit
import MaterialComponents.MaterialBottomSheet

class ReviewViewController: UIViewController {
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var WriteReview: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    func configure() {
        // Set TableView
        TableView.delegate = self
        TableView.dataSource = self
        TableView.rowHeight = UITableView.automaticDimension
        
        // Set Font
        WriteReview.titleLabel?.font = UIFont.NotoSansCJKkr(type: .medium, size: 18)
    }
    
    @IBAction func WriteReview(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "WriteReviewViewController") as! WriteReviewViewController
        let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: vc)
        bottomSheet.mdc_bottomSheetPresentationController?.preferredSheetHeight = 406
        
        present(bottomSheet, animated: true, completion: nil)
    }
}

extension ReviewViewController: UITableViewDelegate {
}

extension ReviewViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = TableView.dequeueReusableCell(withIdentifier: ReviewTableViewCell.identifier, for: indexPath) as? ReviewTableViewCell else {
            return UITableViewCell()
        }

        cell.configure()
        cell.delegate = self
        return cell
    }
}

extension ReviewViewController: CVCellDelegate {
    func selectedCVCell(_ index: Int) {
        print(index)
    }
}
