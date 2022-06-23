//
//  Storage.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/21.
//

import Foundation

public class Storage {
    static func isFirstTime() -> Bool {
        let defaults = UserDefaults.standard
        if defaults.object(forKey: "loginToken") == nil {
            defaults.set("No", forKey:"isFirstTime")
            return true
        } else {
            return false
        }
    }
}
