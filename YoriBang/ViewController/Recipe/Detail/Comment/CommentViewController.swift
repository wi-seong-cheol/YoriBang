//
//  CommentViewController.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/23.
//

import Foundation
import UIKit

class CommentViewContorller: UIViewController {
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var MessageTextView: UITextView!
    @IBOutlet weak var InputView: UIView!
    
    var comment = [CommentModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    func configure() {
        comment = GetData.shared.getComment()
        
        // Set Table View
        TableView.delegate = self
        TableView.dataSource = self
        TableView.rowHeight = UITableView.automaticDimension

        // Set Font
        MessageTextView.font = UIFont.NotoSansCJKkr(type: .medium, size: 12)
        
        // Set View
        InputView.layer.borderWidth = 1
        InputView.layer.cornerRadius = 5
        InputView.layer.borderColor = UIColor(red: 229, green: 102, blue: 90).cgColor
        
        // Set Keyboard
        let tapGuesterHideKeyboard = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        let tapGuesterShowKeyboard = UITapGestureRecognizer(target: self, action: #selector(showKeyboard))
        TableView.addGestureRecognizer(tapGuesterHideKeyboard)
        MessageTextView.superview?.addGestureRecognizer(tapGuesterShowKeyboard)
        
        // Set TextView
        MessageTextView.text = "댓글을 작성해주세요."
        MessageTextView.delegate = self
    }
}

extension CommentViewContorller: UITableViewDelegate {
    
}

extension CommentViewContorller: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comment.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = TableView.dequeueReusableCell(withIdentifier: CommentTableViewCell.identifier, for: indexPath) as? CommentTableViewCell else {
            return UITableViewCell()
        }

        cell.configure(comment[indexPath.row])
        if indexPath.row != 0 {
            cell.BestComment.isHidden = true
            cell.BestCommentWidth.constant = 0
        } else {
            cell.BestComment.isHidden = false
            cell.BestCommentWidth.constant = 47
        }
        return cell
    }
}

// MARK: - Keyboard 관련 메서드
extension CommentViewContorller {

    // Keyboard handler
    @objc func hideKeyboard() {
        MessageTextView.resignFirstResponder()
    }

    @objc func showKeyboard() {
        MessageTextView.becomeFirstResponder()
    }
}

// MARK: - TextView 관련 메서드
extension CommentViewContorller {
    func textViewSetupView(_ textView: UITextView) {
        textCheck(textView,"댓글을 작성해주세요.")
    }
    
    func textCheck(_ textView: UITextView, _ text: String) {
        if textView.text == text {
            textView.text = ""
            textView.textColor = UIColor.black
        } else if textView.text == "" {
            textView.text = text
            textView.textColor = UIColor.lightGray
        }
    }
}

//MARK: - UITextViewDelegate 관련 메서드
extension CommentViewContorller: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textViewSetupView(textView)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textViewSetupView(textView)
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
        }
        return true
    }
}
