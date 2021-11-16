//
//  ViewController.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/04.
//

import UIKit

class RecipeViewController: UIViewController {
    
    @IBOutlet weak var AddBtnView: UIView!
    @IBOutlet weak var AddBackgroundView: UIView!
    @IBOutlet var AddItem: [UIButton]!
    @IBOutlet weak var AddBtn: UIButton!
    @IBOutlet var CategoryLabel: [UILabel]!
    
    @IBOutlet var Category: [UIView]!
    
    private let BackView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.7)
        return view
    }()
    var AddState = false
    let shapeLayer = CAShapeLayer()
    
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
        AddBackgroundView.layer.cornerRadius = AddBackgroundView.frame.width / 2
        AddBackgroundView.clipsToBounds = true
        AddBackgroundView.layer.shadowRadius = AddBackgroundView.frame.width / 2
        AddBackgroundView.layer.shadowColor = UIColor.black.cgColor
        AddBackgroundView.layer.shadowOpacity = 0.3
        AddBackgroundView.layer.borderWidth = 0.1
        AddBackgroundView.layer.borderColor = UIColor(red: 253, green: 143, blue: 82).cgColor
        AddBackgroundView.backgroundColor = UIColor(red: 254, green: 139, blue: 88, a: 53)
        
        // BackView
        view.insertSubview(BackView, at: 2)
        BackView.alpha = 0.0
        
        setupLayout()
        let backTap = UITapGestureRecognizer(target: self, action: #selector(dimmedViewTapped(_:)))
        BackView.addGestureRecognizer(backTap)
        BackView.isUserInteractionEnabled = true
        
        // Category Button Setting
        for label in CategoryLabel {
            label.font = UIFont.Gowun(size: 10)
        }
        for categoryView in Category {
            let tapOnMyViewButton = CustomGesture(target: self, action: #selector(self.didTapOnMyViewButton(gesture: )))
            tapOnMyViewButton.tag = categoryView.tag
            categoryView.addGestureRecognizer(tapOnMyViewButton)
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
extension RecipeViewController {
    func AddBtnSet(_ state: Bool, _ alpha: Int) {
        let currentState = state
        for addItemBtn in AddItem {
            addItemBtn.isHidden = currentState
            addItemBtn.alpha = 1
        }
    }
    
    func openAddBtn() {
        AddBtn.setImage(UIImage(named: "add_white_asset"), for: .normal)
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
        AddBtn.setImage(UIImage(named: "add_orange_asset"), for: .normal)
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

// MARK: - CategoryBtn
extension RecipeViewController {
    
}

