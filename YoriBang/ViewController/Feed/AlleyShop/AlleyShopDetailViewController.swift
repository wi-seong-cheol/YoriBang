//
//  AlleyShopDetailViewController.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/19.
//

import Foundation
import UIKit

class AlleyShopDetailViewController: UIViewController {
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var images = [#imageLiteral(resourceName: "add_orange_asset"), #imageLiteral(resourceName: "Add_asset")]
    var imageView = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        addContentScrollView()
        setPageControl()
    }
}

// MARK: - Set Scroll View
extension AlleyShopDetailViewController {
    private func addContentScrollView() {
        for i in 0..<images.count {
            let imageView = UIImageView()
            let xPos = self.view.frame.width * CGFloat(i)
            imageView.frame = CGRect(x: xPos, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
            imageView.image = images[i]
            scrollView.addSubview(imageView)
            scrollView.contentSize.width = imageView.frame.width * CGFloat(i + 1)
        }
    }
}

// MARK: - Set Page Control
extension AlleyShopDetailViewController: UIScrollViewDelegate {
    private func setPageControl() {
        pageControl.numberOfPages = images.count
    }
    
    private func setPageControlSelectedPage(currentPage:Int) {
        pageControl.currentPage = currentPage
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let value = scrollView.contentOffset.x/scrollView.frame.size.width
        setPageControlSelectedPage(currentPage: Int(round(value)))
    }
}
