//
//  ViewController4.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/04.
//

import Foundation
import UIKit
import PagingKit

class FeedViewController: UIViewController {
    
    @IBOutlet weak var AddBtnView: UIView!
    @IBOutlet weak var AddBackgroundView: UIView!
    @IBOutlet var AddItem: [UIButton]!
    @IBOutlet weak var AddBtn: UIButton!
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func configure() {
        // Add Button Setting
        AddBtnSet(true, 1)
        
        // BackView
        view.insertSubview(BackView, at: 2)
        BackView.alpha = 0.0
        
        setupLayout()
        let backTap = UITapGestureRecognizer(target: self, action: #selector(dimmedViewTapped(_:)))
        BackView.addGestureRecognizer(backTap)
        BackView.isUserInteractionEnabled = true
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
        let storyboard = UIStoryboard(name:"Upload", bundle: nil)
        let pushVC = storyboard.instantiateViewController(withIdentifier: "UploadRecipeViewController")
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    
    @IBAction func AddBtn(_ sender: Any) {
        if AddState {
            closeAddBtn()
        } else {
            openAddBtn()
        }
    }
}

// MARK: - AddButtonSetting
extension FeedViewController {
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
