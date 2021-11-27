//
//  File.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/04.
//

import Foundation
import UIKit

class MyRoomViewController: UIViewController {
    
    @IBOutlet weak var AddBtnView: UIView!
    @IBOutlet weak var AddBackgroundView: UIView!
    @IBOutlet var AddItem: [UIButton]!
    @IBOutlet weak var AddBtn: UIButton!
    @IBOutlet weak var ProfileView: UIView!
    @IBOutlet weak var MyRoom: UILabel!
    @IBOutlet weak var Profile: UIImageView!
    @IBOutlet weak var Nickname: UILabel!
    @IBOutlet weak var GoProfileLabel: UILabel!
    @IBOutlet weak var MyProfile: UILabel!
    @IBOutlet weak var Like: UILabel!
    @IBOutlet weak var Badge: UILabel!
    @IBOutlet weak var Setting: UILabel!
    @IBOutlet var Category: [UIView]!
    
    private let BackView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.7)
        return view
    }()
    var AddState = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        hideBackSheetAndGoBack()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func configure() {
        // Set Navigation
        self.navigationItem.backBarButtonItem = UIBarButtonItem.BackButton()
        
        // Add Button Setting
        AddBtnSet(true, 1)
        
        // BackView
        view.insertSubview(BackView, at: 11)
        BackView.alpha = 0.0
        
        setupLayout()
        let backTap = UITapGestureRecognizer(target: self, action: #selector(dimmedViewTapped(_:)))
        BackView.addGestureRecognizer(backTap)
        BackView.isUserInteractionEnabled = true
        
        // Set Font
        MyRoom.font = UIFont.NotoSansCJKkr(type: .bold, size: 16)
        Nickname.font = UIFont.NotoSansCJKkr(type: .medium, size: 14)
        GoProfileLabel.font = UIFont.NotoSansCJKkr(type: .medium, size: 12)
        MyProfile.font = UIFont.NotoSansCJKkr(type: .medium, size: 12)
        Like.font = UIFont.NotoSansCJKkr(type: .medium, size: 12)
        Badge.font = UIFont.NotoSansCJKkr(type: .medium, size: 12)
        Setting.font = UIFont.NotoSansCJKkr(type: .medium, size: 12)
        
        // Set View
        Profile.layer.cornerRadius = Profile.frame.width/2
        Profile.layer.cornerRadius = Profile.frame.width/2
        Profile.layer.borderColor = UIColor(red: 229, green: 102, blue: 80).cgColor
        Profile.layer.borderWidth = 1
        
        // Set Event
        for category in Category {
            let gesture = UITapGestureRecognizer(target: self, action: #selector(self.goPage(sender:)))
            category.addGestureRecognizer(gesture)
        }
        
    }
    
    @objc func didTapOnMyViewButton(gesture: CustomGesture) {
        guard let tag = gesture.tag else {
            print("Tag가 존재하지 않습니다.")
            return
        }
        switch tag {
        case 0:
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "AllRecipeViewController")
            self.navigationController?.pushViewController(pushVC!, animated: true)
            break
        case 1:
            print(tag)
            
        default:
            break
        }
    }
    
    private func setupLayout() {
        BackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            BackView.topAnchor.constraint(equalTo: view.topAnchor),
            BackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            BackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            BackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @IBAction func AddRecipe(_ sender: Any) {
        hideBackSheetAndGoBack()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            let storyboard = UIStoryboard(name:"Upload", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "UploadRecipeViewController")
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func AddBtn(_ sender: Any) {
        if AddState {
            closeAddBtn()
        } else {
            openAddBtn()
        }
    }
    
    @objc func goPage(sender: UIGestureRecognizer) {
        let storyboard  = UIStoryboard(name: "Profile", bundle: nil)
        let vc          = storyboard.instantiateViewController(withIdentifier: "ProfileViewController")
        self.navigationController!.pushViewController(vc, animated: true)
    }
}


// MARK: - AddButtonSetting
extension MyRoomViewController {
    func AddBtnSet(_ state: Bool, _ alpha: Int) {
        let currentState = state
        for addItemBtn in AddItem {
            addItemBtn.isHidden = currentState
            addItemBtn.alpha = 1
        }
    }
    
    func openAddBtn() {
        AddBtn.setImage(UIImage(named: "AddClick"), for: .normal)
        TabBarViewController.edit = false
        UIView.animate(withDuration: 0.25, animations: {
            self.AddBtnView.transform =  CGAffineTransform(rotationAngle: CGFloat.pi * (1/4))
            self.AddBackgroundView.transform = CGAffineTransform(scaleX: 5, y: 5)
            self.BackView.alpha = 0.7
            self.AddBtnSet(false, 0)
            self.AddState = true
        })
    }
    
    func closeAddBtn() {
        AddBtn.setImage(UIImage(named: "Add"), for: .normal)
        TabBarViewController.edit = true
        UIView.animate(withDuration: 0.25, animations: {
            self.AddBtnView.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 2)
            self.AddBackgroundView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            self.BackView.alpha = 0.0
            self.AddBtnSet(true, 1)
            self.AddState = false
        })
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
    
    
    private func hideBackSheetAndGoBack() {
        closeAddBtn()
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {
            self.BackView.alpha = 0.0
            self.view.layoutIfNeeded()
        }) { _ in
            if self.presentingViewController != nil {
                self.dismiss(animated: false, completion: nil)
            }
        }
    }
    
    @objc private func dimmedViewTapped(_ tapRecognizer: UITapGestureRecognizer) {
        hideBackSheetAndGoBack()
    }
}
