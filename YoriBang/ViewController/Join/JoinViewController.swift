//
//  JoinViewController.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/06.
//

import Foundation
import UIKit
import FirebaseAuth

class JoinViewController: UIViewController {
    @IBOutlet weak var PhoneNumberTextField: UITextField!
    @IBOutlet weak var VerificationCodeTextField: UITextField!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var PhoneNumberLabel: UILabel!
    @IBOutlet weak var VerificationLabel: UILabel!
    @IBOutlet weak var Send: UIButton!
    @IBOutlet weak var Count: UILabel!
    @IBOutlet weak var ServiceUse: UIButton!
    @IBOutlet weak var Privacy: UIButton!
    @IBOutlet weak var AndLabel: UILabel!
    @IBOutlet weak var OkLabel: UIButton!
    
    private var verificationID: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    func configure() {
        // Set Font
        PhoneNumberTextField.font = UIFont.NotoSansCJKkr(type: .regular, size: 14)
        VerificationCodeTextField.font = UIFont.NotoSansCJKkr(type: .regular, size: 14)
        TitleLabel.font = UIFont.NotoSansCJKkr(type: .bold, size: 20)
        PhoneNumberLabel.font = UIFont.NotoSansCJKkr(type: .medium, size: 16)
        VerificationLabel.font = UIFont.NotoSansCJKkr(type: .medium, size: 16)
        Send.titleLabel?.font = UIFont.NotoSansCJKkr(type: .medium, size: 12)
        Count.font = UIFont.NotoSansCJKkr(type: .regular, size: 14)
        ServiceUse.titleLabel?.font = UIFont.NotoSansCJKkr(type: .regular, size: 14)
        Privacy.titleLabel?.font = UIFont.NotoSansCJKkr(type: .regular, size: 14)
        AndLabel.font = UIFont.NotoSansCJKkr(type: .regular, size: 14)
        OkLabel.titleLabel?.font = UIFont.NotoSansCJKkr(type: .medium, size: 18)
        
        // Set Button
        Send.layer.cornerRadius = 7
        let underLine = NSUnderlineStyle.thick.rawValue
        let ServiceUseText = ServiceUse.titleLabel?.text
        let PrivacyText = Privacy.titleLabel?.text
        var attribute = NSMutableAttributedString(string: ServiceUseText ?? "")
        attribute.addAttribute(NSMutableAttributedString.Key.underlineStyle, value: underLine, range: NSRange(location: 0, length: ServiceUseText!.count))
        ServiceUse.setAttributedTitle(attribute, for: .normal)
        attribute = NSMutableAttributedString(string: PrivacyText ?? "")
        attribute.addAttribute(NSMutableAttributedString.Key.underlineStyle, value: underLine, range: NSRange(location: 0, length: PrivacyText!.count))
        Privacy.setAttributedTitle(attribute, for: .normal)
    }
    
    @IBAction func sendBtn(_ sender: Any) {
        PhoneAuthProvider.provider()
            .verifyPhoneNumber(PhoneNumberTextField.text ?? "", uiDelegate: nil) { verification, error in
                if error == nil {
                    self.verificationID = verification
                    return
                } else {
                    print("Phone Verification Error:\(error.debugDescription)")
                }
            }
    }
    
    @IBAction func verificationBtn(_ sender: Any) {
        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: verificationID ?? "",
            verificationCode: VerificationCodeTextField.text ?? ""
        )
        
        Auth.auth().signIn(with: credential) { authResult, error in
            if error == nil {
                print(authResult ?? "")
                print("User Sign in..")
                UserDefaults.standard.set(self.verificationID, forKey: "authVerificationID")
            } else {
                print(error.debugDescription)
            }
        }
    }
    
}
