//
//  RecipeUploadTableViewcell.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/24.
//

import Foundation
import UIKit

class RecipeUploadTableViewCell: UITableViewCell {
    
    static let identifier = "RecipeUploadTableViewCell"
    @IBOutlet weak var DescTextView: UITextView!
    @IBOutlet weak var DescView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure() {
        DescTextView.text = "레시피를 설명해주세요.  (최대40글자)"
    }
}

//MARK: - textView 관련 메서드
extension RecipeUploadTableViewCell {
    func textViewSetupView(_ textView: UITextView) {
        textCheck(textView,"레시피를 설명해주세요.  (최대40글자)")
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
extension RecipeUploadTableViewCell: UITextViewDelegate {
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
