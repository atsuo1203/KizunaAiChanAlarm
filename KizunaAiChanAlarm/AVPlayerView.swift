//
//  AVPlayerView.swift
//  KizunaAiChanAlarm
//
//  Created by hyuga on 2017/09/02.
//  Copyright © 2017年 Atsuo Yonehara. All rights reserved.
//

import UIKit
import AVFoundation

class AVPlayerView: UIView {
    var playerItem: AVPlayerItem!
    var videoPlayer: AVPlayer!
    
    override class var layerClass: AnyClass {
        return AVPlayerLayer.self
    }

    func play() {
        let path = Bundle.main.path(forResource: "testVideo", ofType: "mp4")!
        let fileURL = URL(fileURLWithPath: path)
        let avAsset = AVAsset(url: fileURL)
        playerItem = AVPlayerItem(asset: avAsset)
        videoPlayer = AVPlayer(playerItem: playerItem)
        let layer = self.layer as! AVPlayerLayer
        layer.videoGravity = AVLayerVideoGravityResizeAspect
        layer.player = videoPlayer
        videoPlayer.play()
    }
}
