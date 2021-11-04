//
//  ViewController.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/04.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

//import UIKit
//
//class ViewController: UIViewController {
//
//    @IBOutlet weak var emailTextField: UITextField!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//
//    @IBAction func loginBtn(_ sender: Any) {
//        let email = emailTextField.text!
//
//        if !isValidEmail(email: email) {
//            OKDialog("이메일 형식이 올바르지 않습니다.")
//            return
//        }
//
//        Network.shared.apollo.perform(mutation: LoginMutation(email: email)) { result in
//            switch result {
//            case .success(let graphQLResult):
//                if let loginToken = graphQLResult.data?.login {
////                    UserDefaults.standard.set(loginToken, forKey: "loginToken")
////                    self.performSegue(withIdentifier: "showHome", sender: nil)
//                }
//            case .failure(let error):
//                self.OKDialog("로그인에 실패하였습니다.")
//                print("Error: \(error)")
//            }
//        }
//    }
//
//    func isValidEmail(email: String) -> Bool {
//        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
//        return emailTest.evaluate(with: email)
//    }
//}
