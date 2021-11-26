//
//  ViewController2.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/04.
//

import Foundation
import UIKit

class JournalViewController: UIViewController {
    
    @IBOutlet weak var TableView: UITableView!
    
    @IBOutlet weak var TitleLabel: UILabel!
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
        
        // TableView Setting
        TableView.delegate = self
        TableView.dataSource = self
        
        // Add Button Setting
        AddBtnSet(true, 1)
        
        // BackView
        view.insertSubview(BackView, at: 2)
        BackView.alpha = 0.0
        
        setupLayout()
        let backTap = UITapGestureRecognizer(target: self, action: #selector(dimmedViewTapped(_:)))
        BackView.addGestureRecognizer(backTap)
        BackView.isUserInteractionEnabled = true
        
        // Set Font
        TitleLabel.font = UIFont.NotoSansCJKkr(type: .bold, size: 16)
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
}

// MARK: - AddButtonSetting
extension JournalViewController {
    func AddBtnSet(_ state: Bool, _ alpha: Int) {
        let currentState = state
        for addItemBtn in AddItem {
            addItemBtn.isHidden = currentState
            addItemBtn.alpha = 1
        }
    }
    
    func openAddBtn() {
        AddBtn.setImage(UIImage(named: "AddClick"), for: .normal)
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

// MARK: - TableView Delegate
extension JournalViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name:"Detail", bundle: nil)
        let pushVC = storyboard.instantiateViewController(withIdentifier: "PostDetailViewController")
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
}

// MARK: - TableView DataSource
extension JournalViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = TableView.dequeueReusableCell(withIdentifier: JournalTableViewCell.identifier, for: indexPath) as? JournalTableViewCell else {
            return UITableViewCell()
        }

        cell.configure()
        let background = UIView()
        background.backgroundColor = .clear
        cell.selectedBackgroundView = background
        return cell
    }
}

