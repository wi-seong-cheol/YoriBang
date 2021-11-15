//
//  UIFont + Extension.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/15.
//

import Foundation
import UIKit

extension UIFont {
    class func Gowun(size: CGFloat) -> UIFont! {
        let name = "GowunDodum-Regular"
        guard let font = UIFont(name: name, size: size) else {
            print("Do not Font")
            return nil
        }
        return font
    }
    
}
