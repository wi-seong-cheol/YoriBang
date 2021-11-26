//
//  APIClient.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/26.
//

import Foundation
import FirebaseAuth

class DataSource: UIViewController {
    static let shared = DataSource()
    
    func sendVerificationCode(_ phoneNumberFormat: String,completion: @escaping (_ succeed: Bool, _ failed: Error?) -> Void) {
        let phoneNumber = phoneNumberFormat
        
        Network.shared.apollo.perform(mutation: SendVerificationCodeMutation(input: SendVerificationCodeInput(phoneNumber: phoneNumber))) { result in
            switch result {
            case .success(let Result):
                print(Result)
                completion(true, nil)
            case .failure(let error):
                print("Error: \(error)")
                completion(false, error)
            }
        }
    }
    
    func login(_ phoneNumberFotmat: String, _ verificationCode: String ,completion: @escaping (_ succeed: String, _ failed: Error?) -> Void) {
            let phoneNumber = phoneNumberFotmat
            let code = verificationCode

            Network.shared.apollo.perform(mutation: LoginMutation(input: LoginInput(phoneNumber: phoneNumber, verificationCode: code))) { result in
                switch result {
                case .success(let Result):
                    print(Result)
                    completion(Result.data?.login ?? "", nil)
                case .failure(let error):
                    print("Error: ----- \(error)")
                    completion("", error)
                }
            }
    }
    
    func signIn(_ customToken: String ,completion: @escaping (_ succeed: Bool, _ failed: Error?) -> Void) {
        let token = customToken

        Auth.auth().signIn(withCustomToken: token) { user, error in
            if error == nil {
                if let user = Auth.auth().currentUser {
                    user.getIDTokenResult { result, error in
                        if error == nil {
                            UserDefaults.standard.set(result?.token, forKey: "loginToken")
                            completion(true, nil)
                        } else {
                            print("Token Get Failed")
                            print("Phone Verification Error:\(error.debugDescription)")
                            completion(false, nil)
                        }
                    }
                }
                completion(false, nil)
            } else {
                print("Phone Verification Error:\(error.debugDescription)")
                completion(false, error)
            }
        }
    }
}
