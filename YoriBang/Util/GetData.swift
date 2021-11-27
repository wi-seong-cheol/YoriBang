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
    
    private var newRacipeThumbNails: [UIImage] = [
        UIImage(named: "Image0") ?? UIImage(),
        UIImage(named: "Image1") ?? UIImage(),
        UIImage(named: "Image2") ?? UIImage(),
        UIImage(named: "Image3") ?? UIImage(),
        UIImage(named: "Image4") ?? UIImage()
    ]
    
    private var rankThumbNails: [UIImage] = [
        UIImage(named: "Image5") ?? UIImage(),
        UIImage(named: "Image6") ?? UIImage()
    ]
    
    private var alleyShopProfile: [UIImage] = [
        UIImage(named: "Image7") ?? UIImage(),
        UIImage(named: "Image8") ?? UIImage()
    ]
    
    private var newTitles: [String] = [
        "해장엔 김칫국이 맞지! 시원한 해장 레시피",
        "퐁실퐁실한 계란찜 만드는 법",
        "간단하게 엽X떡볶이 뺨치는 라볶이 만들어봤음",
        "버섯전골? 어렵지 않아요~",
        "기분 잡친 날엔 잡채로 풀어보자"
    ]
    
    private var rankTitles: [String] = [
        "밤새 술 마신 날 해장하기 딱 좋은 김칫국 레시피",
        "김칫국을 만드는 또다른 레시피!"
    ]
    
    private var stepTitles: [String] = [
        "찌갯국물 끓이기",
        "돼지고기, 배추김치 볶기",
        "찌개 끓이기",
        "간하기, 두부·파·후춧가루 넣기"
    ]
    
    private var alleyTitles: [String] = [
        "1등급 푸드마켓",
        "홈에이플러스 익스프레스"
    ]
    
    private var nickNames: [String] = [
        "주방장",
        "햇살이",
        "그림자",
        "분홍공룡",
        "ACheif123",
        "주방장",
        "햇살이",
        "그림자",
        "분홍공룡",
        "ACheif123"
    ]
    
    private var contents: [String] = [
        "샐러드 재료 가져가실 분? 다이어트 실패함",
        "혹시 수박이랑 다른 과일 교환하실 분 있나요? 수박 한 통은 역시 무리수...",
        "간만에 LA갈비 했는데 너무 많이 남았다ㅠㅠ 선착순 두 명 나눔 간드아",
        "저랑 내일 신선마켓에서 샐러드 재료 같이 구매하실 분 구합니다!",
        "잡채 양 조절 실패... 다른 반찬이랑 바꿀 사람?",
        "요즘 스트레스 받아서 떡볶이가 너무 땡기는데 공동구매 할 사람 있어?",
        "아니 요즘 파가 왜 이리 비싼거냐 대체 그런 의미에서 양파, 당근이랑 파 바꿀 사람?",
        "계란이랑 다른 식재료 교환하실 분 구해요~",
        "베이킹 좋아하는 친구 있어? 베이킹 재료 소분해서 나눠가지고 싶은데...! 버터랑 강력분"
    ]
    
    private var alleyDesc: [String] = [
        "신선함과 신속함을 동시에! 가져다주는 유용한 1등급 푸드마켓 으로 최고 입니다 !",
        "신선함과 신속함을 동시에! 가져다주는 유용한 1등급 홈에이플러스 익스프레스 으로 최고 입니다 !"
    ]
    
    private var stepDesc: [String] = [
        "냄비에 물을 붓고 무와 양파를 넣어, 센불에 8분 정도 올려 끓으면, 중불로 낮추어 20분 정도 더 끓이다가 다시마를 넣고 불을 끈다음 5분정도 두었다가 체에 걸러 찌갯국물을 만든다.",
        "냄비를 달구어 참기름을 두르고, 돼지고기를 넣어 중불에서 2분 정도 볶다가, 배추김치를 넣고 2분 정도 더 볶는다.",
        "볶은 돼지고기와 배추김치에 찌갯국물과 고춧가루를 넣고, 센불에 6분 정도 올려 끓으면 중불로 낮추어 30분 정도 더 끓인다.",
        "소금으로 간을 맞추고, 두부와 파·후춧가루를 넣고, 2분 정도 더 끓인다."
    ]
    
    private var commentContent: [String] = [
        "이 레시피는 신이다... 김칫국 한 사발 들이키니까 숙취 싹 나았다. 감사합니다",
        "안그래도 오늘 김칫국 마신다는 소리 들어서 기분 나빴는데 이 레시피대로 요리하다가 한그릇 뚝딱 비워버린 나를 발견함"
    ]
    
    private var location: [String] = [
        "노원구",
        "강남구",
        "강서구",
        "중구",
        "노원구",
        "강남구",
        "강서구",
        "중구",
        "강동구"
    ]
    
    private var profiles: [UIImage] = [
        UIImage(named: "Profile0") ?? UIImage(),
        UIImage(named: "Profile1") ?? UIImage(),
        UIImage(named: "Profile2") ?? UIImage(),
        UIImage(named: "Profile3") ?? UIImage(),
        UIImage(named: "Profile4") ?? UIImage(),
        UIImage(named: "Profile0") ?? UIImage(),
        UIImage(named: "Profile1") ?? UIImage(),
        UIImage(named: "Profile2") ?? UIImage(),
        UIImage(named: "Profile3") ?? UIImage(),
        UIImage(named: "Profile4") ?? UIImage()
    ]
    
    
    
    
    func getRecipe() -> [RecipeModel] {
        var result = [RecipeModel]()
        
        for i in 0..<newTitles.count {
            let recipeInfo = RecipeModel (
                thumbNail: newRacipeThumbNails[i],
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
    
    
    func getRank() -> [RankModel] {
        var result = [RankModel]()
        
        for i in 0..<rankTitles.count {
            let rankInfo = RankModel (
                rank: i + 1,
                thumbNail: rankThumbNails[i],
                title: rankTitles[i]
            )
            result.append(rankInfo)

        }
        
        return result
    }
    
    func getPost() -> [PostModel] {
        var result = [PostModel]()
        
        for i in 0..<contents.count {
            let rankInfo = PostModel (
                writer: UserModel(
                    profile: profiles[i],
                    nickName: nickNames[i],
                    id: ""),
                create: String(i+1),
                location: location[i],
                content: contents[i],
                like: i*2,
                commet: i+1,
                postImage: [UIImage()])
            result.append(rankInfo)

        }
        
        return result
    }
    
    func getAlley() -> [AlleyShopModel] {
        var result = [AlleyShopModel]()
        
        for i in 0..<alleyTitles.count {
            let rankInfo = AlleyShopModel (
                thumbNail: alleyShopProfile[i],
                name: alleyTitles[i],
                review: i*2,
                like: i+1,
                desc: alleyDesc[i])
            result.append(rankInfo)

        }
        
        return result
    }
    
    func getStep() -> [StepModel] {
        var result = [StepModel]()
        
        for i in 0..<stepTitles.count {
            let rankInfo = StepModel (
                step: i+1,
                title: stepTitles[i],
                desc: stepDesc[i])
            result.append(rankInfo)

        }
        
        return result
    }
    
    func getComment() -> [CommentModel] {
        var result = [CommentModel]()
        
        for i in 0..<commentContent.count {
            let rankInfo = CommentModel (
                writer: UserModel(
                    profile: profiles[i],
                    nickName: nickNames[i],
                    id: ""),
                locaion: "",
                create: String(i+1),
                content: commentContent[i])
            result.append(rankInfo)

        }
        
        return result
    }
}
