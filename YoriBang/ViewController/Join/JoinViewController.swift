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
    
    private var verificationID: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
