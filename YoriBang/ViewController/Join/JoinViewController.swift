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
    
    var mainTimer:Timer?
    let firstSecond: Int = 180
    var counter: Int = 0
    
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
        
        // Set Keyboard
        let tapGuesterHideKeyboard = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        self.view.addGestureRecognizer(tapGuesterHideKeyboard)
        
    }
    
    @IBAction func sendBtn(_ sender: Any) {
        let phoneNumber = getPhoneNumberFormat()
        
        Count.textColor = .red
        
        DataSource.shared.sendVerificationCode(phoneNumber) { succeed, failed in
            if succeed {
                self.startTimer()
                self.OKDialog("인증번호가 발송되었습니다.")
            } else {
                self.OKDialog("인증번호가 발송에 실패했습니다 번호를 확인해주세요.")
            }
        }
    }
    
    // Keyboard handler
    @objc func hideKeyboard() {
        PhoneNumberTextField.resignFirstResponder()
        VerificationCodeTextField.resignFirstResponder()
    }

    func stop() {
        mainTimer?.invalidate()
        mainTimer = nil
    }
    
    @IBAction func verificationBtn(_ sender: Any) {
        
        let phoneNumber = getPhoneNumberFormat()
        let verficationCode = VerificationCodeTextField.text ?? ""
        
        DataSource.shared.login(phoneNumber, verficationCode) { succeed, failed in
            if succeed != "" {
                DataSource.shared.signIn(succeed) { succeed, failed in
                    if succeed {
                        print("success")
                    }
                }
            } else {
                print("failed")
            }
        }
        
    }
    
    func startTimer() {
        mainTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.counter += 1
            let second = self.firstSecond - self.counter
            let minute = second/60
            DispatchQueue.main.async {
                self.Count.text = String(minute) + ":" + String(format: "%02d", second%60)
            }
            if second == 0 {
                self.stop()
            }
        }
    }
    
    func getPhoneNumberFormat() -> String {
        var phoneNumber = PhoneNumberTextField.text ?? ""
        phoneNumber.remove(at: phoneNumber.startIndex)
        let phoneNumberFormat = "+82" + phoneNumber
        return phoneNumberFormat
    }
    
    @IBAction func openServiceTerms(_ sender: Any) {
        if let url = URL(string: "http://goolge.com") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    @IBAction func openPrivacy(_ sender: Any) {
        if let url = URL(string: "http://goolge.com") {
            UIApplication.shared.open(url, options: [:])
        }
    }
}
