//
//  PostModel.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/27.
//

import Foundation
import UIKit

struct PostModel {
    var writer: UserModel
    var create: String
    var location: String
    var content: String
    var like: Int
    var commet: Int
    var postImage: [UIImage]
}
