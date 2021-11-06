//
//  TabBarViewController.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/04.
//

import Foundation
import UIKit
import MaterialComponents.MaterialBottomSheet
import RAMAnimatedTabBarController

class TabBarViewController: UITabBarController {
    static var edit = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
    }
}

extension TabBarViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return TabBarViewController.edit
    }
}
//
//    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        let image1 = item.image ?? UIImage()
//        let image2 = UIImage(named: "Add_asset")
//        let emptyData = image1.pngData()
//        let compareImageData = image2!.pngData()
//
//        guard compareImageData == emptyData else {
//            item.imageInsets.top = 20
//            index = true
//            return
//        }
//        index = false
//    }
//
//    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//        if index == false {
////            let vc = storyboard?.instantiateViewController(withIdentifier: "BottomSheetViewController") as! BottomSheetViewController
////
////            // MDC 바텀 시트로 설정
////            let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: vc)
////
////            bottomSheet.mdc_bottomSheetPresentationController?.preferredSheetHeight = 200
////            // 보여주기
////            present(bottomSheet, animated: true, completion: nil)
//        }
//        return index
//    }
//}
//
//class CustomTabBarViewController: RAMAnimatedTabBarController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        configure()
//    }
//
//    func configure() {
//
//        let vc1 = storyboard?.instantiateViewController(identifier: "ViewController") ?? UIViewController()
//        let vc2 = UIViewController()
//        let vc3 = UIViewController()
//        let vc4 = UIViewController()
//        let vc5 = UIViewController()
//
////        let vc2 = ViewController2()
////        let vc3 = ViewController3()
////        let vc4 = ViewController4()
////        let vc5 = ViewController5()
//
//        vc1.tabBarItem = RAMAnimatedTabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
//        (vc1.tabBarItem as? RAMAnimatedTabBarItem)?.animation = RAMRightRotationAnimation()
//        vc2.tabBarItem = RAMAnimatedTabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
//        (vc2.tabBarItem as? RAMAnimatedTabBarItem)?.animation = RAMRightRotationAnimation()
//        vc3.tabBarItem = RAMAnimatedTabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
//        (vc3.tabBarItem as? RAMAnimatedTabBarItem)?.animation = RAMRightRotationAnimation()
//        vc4.tabBarItem = RAMAnimatedTabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
//        (vc4.tabBarItem as? RAMAnimatedTabBarItem)?.animation = RAMRightRotationAnimation()
//        vc5.tabBarItem = RAMAnimatedTabBarItem(title: "Home", image: UIImage(named: "Add_asset"), tag: 1)
//        (vc5.tabBarItem as? RAMAnimatedTabBarItem)?.animation = CustomRotationAnimation()
//
//
//        setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: false)
//    }
//
//    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        let image1 = item.image ?? UIImage()
//        let image2 = UIImage(named: "Add_asset")
//        let emptyData = image1.pngData()
//        let compareImageData = image2!.pngData()
//
//        guard compareImageData == emptyData else {
////            item.imageInsets.top = 20
////            let vc = storyboard?.instantiateViewController(withIdentifier: "BottomSheetViewController") as! BottomSheetViewController
////
////            // MDC 바텀 시트로 설정
////            let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: vc)
////
////            bottomSheet.mdc_bottomSheetPresentationController?.preferredSheetHeight = 200
////            // 보여주기
////            present(bottomSheet, animated: true, completion: nil)
//            return
//        }
//    }
//
//}
//
//class CustomRotationAnimation : RAMItemAnimation {
//
//    override func playAnimation(_ icon: UIImageView, textLabel: UILabel) {
//        playRotationAnimation(icon)
//        textLabel.textColor = textSelectedColor
//    }
//
//    override func deselectAnimation(_ icon: UIImageView, textLabel: UILabel, defaultTextColor: UIColor, defaultIconColor: UIColor) {
//        playBounceAnimation(icon)
//        textLabel.textColor = defaultTextColor
//    }
//
//    override func selectedState(_ icon: UIImageView, textLabel: UILabel) {
//        textLabel.textColor = textSelectedColor
//    }
//
//    func playRotationAnimation(_ icon : UIImageView) {
//        UIView.animate(withDuration: 0.25, animations: {
//            icon.transform = CGAffineTransform(rotationAngle: CGFloat.pi * (1/4))
//        })
//    }
//
//    func playBounceAnimation(_ icon : UIImageView) {
//        UIView.animate(withDuration: 0.25, animations: {
//            icon.transform = CGAffineTransform(rotationAngle: CGFloat.pi * (1/2))
//        })
//    }
//}
