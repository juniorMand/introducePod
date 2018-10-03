//
//  SwiftyJSONCocoaPods.swift
//  introducePod
//
//  Created by myoung on 03/10/2018.
//  Copyright © 2018 myoung. All rights reserved.
//

import UIKit
import SwiftyJSON

class SwiftyJSONCocoaPods: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /**
         create Json
         - 사용가능한 타입 String, Integer, Double, Float, Boolean, [Any]?, [String: Any]?, JSON
         */
        
        var createJson = JSON()
        createJson["name"].stringValue = "junior"
        createJson["age"].intValue = 35
        createJson["height"].doubleValue = 175.5
        createJson["weight"].floatValue = 65.3
        createJson["male"].boolValue = true
        createJson["hobby"].arrayObject = ["축구", "책읽기", "코딩"] //or nil
        createJson["dictionary"].dictionaryObject = ["key1": "value1"] //or nil
        
//        print("createJson = \(createJson)")
        
        var createOptionalJson = JSON()
        createOptionalJson["name"].string = "sugi" //or nil
        createOptionalJson["age"].int = 30 //or nil
        createOptionalJson["height"].double = 165.3 //or nil
        createOptionalJson["weight"].float = 55.7 //or nil
        createOptionalJson["male"].bool = false //or nil
        createOptionalJson["hobby"].arrayObject = ["노래", "춤"] //or nil
        createOptionalJson["dictionary"].dictionaryObject = ["key2": "value2"] //or nil
        
//        print("createOptionalJson = \(createOptionalJson)")
        
        /**
         사용법
          - 직접 일일히 꺼내서 사용
          - for문을 이용해서 차례대로 꺼내는 방법
         */
        
//        let name = createJson["name"].stringValue
//        let age = createJson["age"].intValue
//        print("name = \(name) ,, age = \(age)")
//
//        for element in createJson {
//            print("key = \(element.0) ,, Value = \(element.1)")
//        }
//
//        for (key, subJson): (String, JSON) in createJson {
//            print("key = \(key) ,, value = \(subJson)")
//        }
        
        /**
         서로 다른 JSON타입 합치기
          - merge 메소드를 통해서 합치기
          - key값이 같을 경우 Array, Dictionary타입은 하나의 키값으로 합쳐지고, 나머지 타입은 뒤에 값으로 대체
         */
//        do {
//            try createJson.merge(with: createOptionalJson)
//        } catch {
//            print("error = \(error.localizedDescription)")
//        }
//        print(createJson)
        
        /**
         JSON 타입을 String으로 변환하기
         */
        if let representation = createJson.rawString([.castNilToNSNull: true]) {
            print(representation)
        }
        
        
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { }

}
