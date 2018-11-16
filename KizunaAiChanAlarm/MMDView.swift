//
//  MMDView.swift
//  KizunaAiChanAlarm
//
//  Created by hyuga on 2017/09/02.
//  Copyright © 2017年 Atsuo Yonehara. All rights reserved.
//

import UIKit
import SceneKit

protocol MMDViewDelegate: class {
    func mmdDidTapped()
}

class MMDView: SCNView {
    weak var mmdDelegate: MMDViewDelegate?

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

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapped(_:)))
        addGestureRecognizer(tapGesture)
    }

    func didTapped(_ gesture: UITapGestureRecognizer) {
        let point = gesture.location(in: self)
        let hitResult = hitTest(point, options: [:])
        if hitResult.count > 1 {
            mmdDelegate?.mmdDidTapped()
        }
    }
}
