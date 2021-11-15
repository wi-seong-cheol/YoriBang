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
    
    class func NotoSansCJKkr(type: NotoSansCJKkrType, size: CGFloat) -> UIFont! {
        let name = "NotoSansCJKkr"
        guard let font = UIFont(name: name + type.name, size: size) else {
            return nil
        }
        return font
    }
    
    enum NotoSansCJKkrType {
        case bold
        
        var name: String {
            switch self {
            case .bold:
                return "-bold"
            }
        }
    }
    
    class func Roboto(type: RobotoType, size: CGFloat) -> UIFont! {
        let name = "Roboto"
        guard let font = UIFont(name: name + type.name, size: size) else {
            print("Do not Font")
            return nil
        }
        return font
    }
    
    enum RobotoType {
        case regular
        
        var name: String {
            switch self {
            case .regular:
                return "-regular"
            }
        }
    }
}
