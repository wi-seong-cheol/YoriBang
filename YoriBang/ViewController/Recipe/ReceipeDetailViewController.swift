//
//  ReceipeDetailViewController.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/19.
//

import Foundation
import UIKit

class RecipeDetailViewController: UIViewController {
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var TableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var Profile: UIImageView!
    @IBOutlet weak var Nickname: UILabel!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var Difficulty: UILabel!
    @IBOutlet weak var CookTime: UILabel!
    @IBOutlet weak var Personnel: UILabel!
    @IBOutlet weak var Review: UIButton!
    @IBOutlet weak var RecipeDesc: UILabel!
    @IBOutlet weak var Desc: UILabel!
    @IBOutlet weak var Comment: UILabel!
    @IBOutlet weak var CommentView: UIView!
    @IBOutlet weak var CommentProfile: UIImageView!
    @IBOutlet weak var CommentNickName: UILabel!
    @IBOutlet weak var CommentContent: UILabel!
    @IBOutlet weak var CommentMore: UIButton!
    @IBOutlet weak var IngredientLabel: UILabel!
    @IBOutlet weak var Ingredient: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    func configure() {
        // Set TableView
        TableView.delegate = self
        TableView.dataSource = self
        DispatchQueue.main.async {
            self.TableViewHeight.constant = self.TableView.contentSize.height + 10
        }
        
        // Set Font
        Profile.layer.cornerRadius = Profile.frame.width/2
        Nickname.font = UIFont.Roboto(type: .regular, size: 10)
        TitleLabel.font = UIFont.NotoSansCJKkr(type: .medium, size: 16)
        Difficulty.font = UIFont.NotoSansCJKkr(type: .regular, size: 12)
        CookTime.font = UIFont.NotoSansCJKkr(type: .regular, size: 10)
        Personnel.font = UIFont.NotoSansCJKkr(type: .regular, size: 10)
        Review.titleLabel?.font = UIFont.NotoSansCJKkr(type: .regular, size: 12)
        RecipeDesc.font = UIFont.NotoSansCJKkr(type: .medium, size: 14)
        Desc.font = UIFont.NotoSansCJKkr(type: .regular, size: 12)
        Comment.font = UIFont.NotoSansCJKkr(type: .medium, size: 14)
        IngredientLabel.font = UIFont.NotoSansCJKkr(type: .medium, size: 14)
        Ingredient.font = UIFont.NotoSansCJKkr(type: .regular, size: 12)
        CommentProfile.layer.cornerRadius = CommentProfile.frame.width/2
        CommentNickName.font = UIFont.Roboto(type: .regular, size: 10)
        CommentContent.font = UIFont.NotoSansCJKkr(type: .medium, size: 10)
        CommentView.layer.borderWidth = 1
        CommentView.layer.cornerRadius = 5
        CommentView.layer.borderColor = UIColor(red: 228, green: 228, blue: 228).cgColor
        CommentMore.titleLabel?.font = UIFont.NotoSansCJKkr(type: .regular, size: 8)
        
        
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

extension RecipeDetailViewController: UITableViewDelegate {
    
}

extension RecipeDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = TableView.dequeueReusableCell(withIdentifier: StepTableViewCell.identifier, for: indexPath) as? StepTableViewCell else {
            return UITableViewCell()
        }
        cell.Count.text = String( indexPath.row + 1)
        cell.configure()
        return cell
    }
}
