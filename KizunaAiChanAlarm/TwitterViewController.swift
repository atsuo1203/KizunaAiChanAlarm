//
//  TwitterViewController.swift
//  KizunaAiChanAlarm
//
//  Created by ren on 2017/09/20.
//  Copyright © 2017年 Atsuo Yonehara. All rights reserved.
//

import UIKit
import TwitterKit

class TwitterViewController: TWTRTimelineViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let client = TWTRAPIClient()
        self.dataSource = TWTRUserTimelineDataSource(screenName: "aichan_nel", apiClient:client)
       // dataSource.includeReplies = true

    }
}
