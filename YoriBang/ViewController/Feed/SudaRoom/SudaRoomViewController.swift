//
//  SudaRoomViewController.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/15.
//

import Foundation
import UIKit
import PagingKit

class SudaRoomViewController: UIViewController {
    
    var menuViewController: PagingMenuViewController!
    var contentViewController: PagingContentViewController!
    
    static var viewController: (UIColor) -> UIViewController = { (color) in
        let vc = UIViewController()
        vc.view.backgroundColor = color
        return vc
    }
    
    var dataSource = [(menu: String, content: UIViewController)]() {
        didSet{
            menuViewController.reloadData()
            contentViewController.reloadData()
        }
    }
    
    lazy var firstLoad: (() -> Void)? = { [weak self, menuViewController, contentViewController] in
        menuViewController?.reloadData()
        contentViewController?.reloadData()
        self?.firstLoad = nil
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        firstLoad?()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuViewController.register(nib: UINib(nibName: "MenuCell", bundle: nil), forCellWithReuseIdentifier: "MenuCell")
        menuViewController.registerFocusView(nib: UINib(nibName: "FocusView", bundle: nil))
        dataSource = makeDataSource()
        contentViewController.scrollView.isScrollEnabled = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? PagingMenuViewController {
            menuViewController = vc
            menuViewController.dataSource = self
            menuViewController.delegate = self
        } else if let vc = segue.destination as? PagingContentViewController {
            contentViewController = vc
            contentViewController.dataSource = self
            contentViewController.delegate = self
        }
    }
    
    fileprivate func makeDataSource() -> [(menu: String, content: UIViewController)] {
        let myMenuArray = ["재료나눔", "먹방", "요리추천", "전체"]
        
        return myMenuArray.map{
            let title = $0
            
            switch title {
            case "재료나눔":
                let vc = self.storyboard?.instantiateViewController(identifier: "TestViewController") as! TestViewController
                return (menu: title, content: vc)
            case "먹방":
                let vc = self.storyboard?.instantiateViewController(identifier: "TestViewController") as! TestViewController
                return (menu: title, content: vc)
            case "요리추천":
                let vc = self.storyboard?.instantiateViewController(identifier: "TestViewController") as! TestViewController
                return (menu: title, content: vc)
            case "전체":
                let vc = self.storyboard?.instantiateViewController(identifier: "TestViewController") as! TestViewController
                return (menu: title, content: vc)
            default:
                let vc = self.storyboard?.instantiateViewController(identifier: "TestViewController") as! TestViewController
                return (menu: title, content: vc)
            }
            
        }
    }
}

// MARK: - Paging Menu Data Source
extension SudaRoomViewController: PagingMenuViewControllerDataSource {
    func numberOfItemsForMenuViewController(viewController: PagingMenuViewController) -> Int {
        return dataSource.count
    }
    
    func menuViewController(viewController: PagingMenuViewController, widthForItemAt index: Int) -> CGFloat {
        return (self.view.frame.width - 48)/4
    }
    
    func menuViewController(viewController: PagingMenuViewController, cellForItemAt index: Int) -> PagingMenuViewCell {
        let cell = viewController.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: index) as! MenuCell
        cell.titleLabel.text = dataSource[index].menu
        cell.titleLabel.font = UIFont.NotoSansCJKkr(type: .bold, size: 12)
        return cell
    }
}

// MARK: - Paging Menu Delegate
extension SudaRoomViewController: PagingMenuViewControllerDelegate {
    func menuViewController(viewController: PagingMenuViewController, didSelect page: Int, previousPage: Int) {
        
        contentViewController.scroll(to: page, animated: true)
    }
}

// MARK: - Paging Content Data Source
extension SudaRoomViewController: PagingContentViewControllerDataSource {
    func numberOfItemsForContentViewController(viewController: PagingContentViewController) -> Int {
        return dataSource.count
    }
    
    func contentViewController(viewController: PagingContentViewController, viewControllerAt index: Int) -> UIViewController {
        return dataSource[index].content
    }
}

// MARK: - Paging Content Delegate
extension SudaRoomViewController: PagingContentViewControllerDelegate {
    func contentViewController(viewController: PagingContentViewController, didManualScrollOn index: Int, percent: CGFloat) {
        menuViewController.scroll(index: index, percent: percent, animated: false)
    }
}
