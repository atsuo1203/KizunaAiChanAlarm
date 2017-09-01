//
//  MMDView.swift
//  KizunaAiChanAlarm
//
//  Created by hyuga on 2017/09/02.
//  Copyright © 2017年 Atsuo Yonehara. All rights reserved.
//

import UIKit
import SceneKit

class MMDView: SCNView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }

    private func setup() {
        scene = SCNScene()
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(2, 18, -17)
        cameraNode.eulerAngles = SCNVector3(0 * Float.pi, 0.95 * Float.pi, 0 * Float.pi)
        scene?.rootNode.addChildNode(cameraNode)

        let ai = MMDSceneSource(named: "art.scnassets/kizunaai.pmx")!.getModel()!
        let pocky = MMDSceneSource(named: "art.scnassets/pocky.vmd")!.getMotion()!
        pocky.repeatCount = .infinity
        ai.addAnimation(pocky, forKey: "pocky")
        delegate = MMDIKController.sharedController

        scene?.rootNode.addChildNode(ai)
    }
}
