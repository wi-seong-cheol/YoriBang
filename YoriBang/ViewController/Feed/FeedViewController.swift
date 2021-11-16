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
    
    
//    var menuViewController: PagingMenuViewController!
//    var contentViewController: PagingContentViewController!
    var AddState = false
    let shapeLayer = CAShapeLayer()
    
//    static var viewController: (UIColor) -> UIViewController = { (color) in
//        let vc = UIViewController()
//        vc.view.backgroundColor = color
//        return vc
//    }
//
//    var dataSource = [(menu: String, content: UIViewController)]() {
//        didSet{
//            menuViewController.reloadData()
//            contentViewController.reloadData()
//        }
//    }
//
//    lazy var firstLoad: (() -> Void)? = { [weak self, menuViewController, contentViewController] in
//        menuViewController?.reloadData()
//        contentViewController?.reloadData()
//        self?.firstLoad = nil
//    }
    private let BackView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.7)
        return view
    }()
//
//
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        firstLoad?()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func configure() {
        // View Pager Setting
//        menuViewController.register(nib: UINib(nibName: "MenuCell", bundle: nil), forCellWithReuseIdentifier: "MenuCell")
//        menuViewController.registerFocusView(nib: UINib(nibName: "FocusView", bundle: nil))
//        dataSource = makeDataSource()
//        contentViewController.scrollView.isScrollEnabled = true
        
        //Button Setting
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
        view.insertSubview(BackView, at: 0)
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
    
    @IBAction func AddBtn(_ sender: Any) {
        if AddState {
            closeAddBtn()
        } else {
            openAddBtn()
        }
    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let vc = segue.destination as? PagingMenuViewController {
//            menuViewController = vc
//            menuViewController.dataSource = self
//            menuViewController.delegate = self
//        } else if let vc = segue.destination as? PagingContentViewController {
//            contentViewController = vc
//            contentViewController.dataSource = self
//            contentViewController.delegate = self
//        }
//    }
//
//    fileprivate func makeDataSource() -> [(menu: String, content: UIViewController)] {
//        let myMenuArray = ["재료나눔", "먹방", "요리추천", "전체"]
//
//        return myMenuArray.map{
//            let title = $0
//
//            switch title {
//            case "재료나눔":
//                let vc = self.storyboard?.instantiateViewController(identifier: "IngrediantShareViewController") as! IngrediantShareViewController
//                return (menu: title, content: vc)
//            case "먹방":
//                let vc = self.storyboard?.instantiateViewController(identifier: "IngrediantShareViewController") as! IngrediantShareViewController
//                return (menu: title, content: vc)
//            case "요리추천":
//                let vc = self.storyboard?.instantiateViewController(identifier: "IngrediantShareViewController") as! IngrediantShareViewController
//                return (menu: title, content: vc)
//            case "전체":
//                let vc = self.storyboard?.instantiateViewController(identifier: "IngrediantShareViewController") as! IngrediantShareViewController
//                return (menu: title, content: vc)
//            default:
//                let vc = self.storyboard?.instantiateViewController(identifier: "IngrediantShareViewController") as! IngrediantShareViewController
//                return (menu: title, content: vc)
//            }
//
//        }
//    }
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

//// MARK: - Paging Menu Data Source
//extension FeedViewController: PagingMenuViewControllerDataSource {
//    func numberOfItemsForMenuViewController(viewController: PagingMenuViewController) -> Int {
//        return dataSource.count
//    }
//
//    func menuViewController(viewController: PagingMenuViewController, widthForItemAt index: Int) -> CGFloat {
//        return (self.view.frame.width - 48)/4
//    }
//
//    func menuViewController(viewController: PagingMenuViewController, cellForItemAt index: Int) -> PagingMenuViewCell {
//        let cell = viewController.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: index) as! MenuCell
//        cell.titleLabel.text = dataSource[index].menu
//        cell.titleLabel.font = UIFont.NotoSansCJKkr(type: .bold, size: 12)
//        return cell
//    }
//}
//
//// MARK: - Paging Menu Delegate
//extension FeedViewController: PagingMenuViewControllerDelegate {
//    func menuViewController(viewController: PagingMenuViewController, didSelect page: Int, previousPage: Int) {
//
//        contentViewController.scroll(to: page, animated: true)
//    }
//}
//
//// MARK: - Paging Content Data Source
//extension FeedViewController: PagingContentViewControllerDataSource {
//    func numberOfItemsForContentViewController(viewController: PagingContentViewController) -> Int {
//        return dataSource.count
//    }
//
//    func contentViewController(viewController: PagingContentViewController, viewControllerAt index: Int) -> UIViewController {
//        return dataSource[index].content
//    }
//}
//
//// MARK: - Paging Content Delegate
//extension FeedViewController: PagingContentViewControllerDelegate {
//    func contentViewController(viewController: PagingContentViewController, didManualScrollOn index: Int, percent: CGFloat) {
//        menuViewController.scroll(index: index, percent: percent, animated: false)
//    }
//}
