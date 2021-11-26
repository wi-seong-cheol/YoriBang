//
//  GetData.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/27.
//

import Foundation
import UIKit

class GetData {
    static let shared = GetData()
    
    private var thumbNails: [UIImage] = [
//        UIImage(named: "image0") ?? UIImage(),
//        UIImage(named: "image1") ?? UIImage(),
        UIImage(named: "image2") ?? UIImage(),
        UIImage(named: "image3") ?? UIImage(),
        UIImage(named: "image4") ?? UIImage(),
//        UIImage(named: "image5") ?? UIImage(),
//        UIImage(named: "image6") ?? UIImage(),
    ]
    
    private var newTitles: [String] = [
        "김칫국을 아주 아주 맛나게 만들었어요.",
        "계란찜 쉽게 만드는 방법!",
        "라볶이를 간단하게 만들었어요~!",
        "복잡 하지않아요! 버섯전골 만들기",
        "남은 재료를 활용해 만드는 잡채!"
    ]
    
    private var nickNames: [String] = [
        "ACheif123",
        "주방장",
        "햇살이",
        "그림자",
        "분홍공룡"
    ]
    
    
    
    private var profiles: [UIImage] = [
        UIImage(named: "Profile0") ?? UIImage(),
        UIImage(named: "Profile1") ?? UIImage(),
        UIImage(named: "Profile2") ?? UIImage(),
        UIImage(named: "Profile3") ?? UIImage(),
        UIImage(named: "Profile4") ?? UIImage()
    ]
    
//    var user: [UserModel]
//
//    init() {
//
//        for i in 0..<nickNames.count {
//            user[i].nickName = nickNames[i]
//            user[i].profile = profiles[i]
//        }
//    }
    
    func getRecipe() -> [RecipeModel] {
        var result = [RecipeModel]()
        
        for i in 0..<thumbNails.count {
            let recipeInfo = RecipeModel (
                thumbNail: thumbNails[i],
                title: newTitles[i],
                writer: UserModel(
                    profile: profiles[i],
                    nickName: nickNames[i],
                    id: ""),
                create: "",
                update: "",
                cookTime: String((i + 1) * 5) + " 분",
                id: ""
            )
            result.append(recipeInfo)

        }
        
        return result
    }
}
