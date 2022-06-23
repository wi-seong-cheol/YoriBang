//
//  ViewController.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/04.
//

import UIKit

class RecipeViewController: UIViewController {
    
    @IBOutlet weak var TableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var AddBtnView: UIView!
    @IBOutlet weak var AddBackgroundView: UIView!
    @IBOutlet var AddItem: [UIButton]!
    @IBOutlet weak var AddBtn: UIButton!
    @IBOutlet weak var RecipeTableView: UITableView!
    @IBOutlet weak var NewRecipe: UILabel!
    @IBOutlet weak var More: UIButton!
    @IBOutlet var CategoryLabel: [UILabel]!
    @IBOutlet var Category: [UIView]!
    
    var newRecipe = [RecipeModel]()
    
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
        newRecipe = GetData.shared.getRecipe()
        
        // Set Navigation
        self.navigationItem.backBarButtonItem = UIBarButtonItem.BackButton()
        
        // Set TableView
        RecipeTableView.delegate = self
        RecipeTableView.dataSource = self
        DispatchQueue.main.async {
            self.TableViewHeight.constant = self.RecipeTableView.contentSize.height + 10
        }
        
        // Set Font
        NewRecipe.font = UIFont.NotoSansCJKkr(type: .bold, size: 14)
        More.titleLabel?.font = UIFont.NotoSansCJKkr(type: .regular, size: 12)
        
        // Add Button Setting
        AddBtnSet(true, 1)
        
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
        case 1:
            break
        case 2:
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "TownViewController")
            self.navigationController?.pushViewController(pushVC!, animated: true)
        case 3:
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "OfficialViewController")
            self.navigationController?.pushViewController(pushVC!, animated: true)
        case 4:
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "CountryViewController")
            self.navigationController?.pushViewController(pushVC!, animated: true)
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
}

// MARK: - Set Button Action
extension RecipeViewController {
    
    @IBAction func MoreNewRecipe(_ sender: Any) {
        closeAddBtn()
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "AllRecipeViewController")
        self.navigationController?.pushViewController(pushVC!, animated: true)
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

// MARK: - CategoryBtn
extension RecipeViewController {
    
}

extension RecipeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "RecipeDetailViewController") else {
            return
        }
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
}

extension RecipeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = RecipeTableView.dequeueReusableCell(withIdentifier: NewRecipeTableViewCell.identifier, for: indexPath) as? NewRecipeTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: newRecipe[indexPath.row])
        let background = UIView()
        background.backgroundColor = .clear
        cell.selectedBackgroundView = background
        return cell
    }
}
