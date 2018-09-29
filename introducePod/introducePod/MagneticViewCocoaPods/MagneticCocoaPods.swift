//
//  MagneticView.swift
//  introducePod
//
//  Created by myoung on 27/09/2018.
//  Copyright © 2018 myoung. All rights reserved.
//

import UIKit
import Magnetic

class MagneticCocoaPods: UIViewController {

    var magneticTitles = ["한국", "미국", "일본", "중국", "필리핀"]
    var magnetic: Magnetic?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let magneticView = MagneticView(frame: CGRect(x: 0,
                                                      y: 0,
                                                      width: self.view.bounds.width,
                                                      height: self.view.bounds.height))
        magnetic = magneticView.magnetic
        magnetic?.magneticDelegate = self
        magnetic?.allowsMultipleSelection = true // 여러개 선택 할수 있게 설정해주기. 기본값은 true
        self.view.addSubview(magneticView)
        
        /**
         다섯개의 노드를 생성
         */
        for magneticTitle in magneticTitles {
            guard let temp = magnetic else {
                print("error")
                return
            }
            let node = Node(text: magneticTitle, image: nil, color: .gray, radius: 30)
            temp.addChild(node)
        }

    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { }
}

extension MagneticCocoaPods: MagneticDelegate {

    /**
     노드를 선택 실행되는 메소드
     */
    func magnetic(_ magnetic: Magnetic, didSelect node: Node) {
        print(node.text ?? "error")
        /**
         선택 할 수 있는 갯수 정해주기
         isSelected 프로퍼티를 통해 선택 했는지 안했는지 판별
         */
        if magnetic.selectedChildren.count > 3 {
            node.deselectedAnimation()
            node.isSelected = false
        } else {
            node.color = .red
        }
    }

    /**
     노드를 클릭 해제시 실행되는 메소드
     */
    func magnetic(_ magnetic: Magnetic, didDeselect node: Node) {
        print(node.text ?? "error")
        node.color = .gray
    }
}
