//
//  WebsiteViewController.swift
//  KizunaAiChanAlarm
//
//  Created by Atsuo Yonehara on 2017/09/19.
//  Copyright © 2017年 Atsuo Yonehara. All rights reserved.
//

import UIKit
import SafariServices

class WebsiteViewController: UIViewController {
    
    @IBAction func aichannelButtonTapped(_ sender: UIButton) {
        showWebView(targetURL: "https://www.youtube.com/channel/UC4YaOt1yT-ZeyB0OmxHgolA/feed?activity_view=1")
    }
    @IBAction func aiGamesButtonTapped(_ sender: UIButton) {
        showWebView(targetURL: "https://www.youtube.com/channel/UCbFwe3COkDrbNsbMyGNCsDg/feed?activity_view=1")
    }
    @IBAction func websiteButtonTapped(_ sender: UIButton) {
        showWebView(targetURL: "https://kizunaai.com/")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showWebView(targetURL: String) {
        let url = URL(string: targetURL)!
        let webView = SFSafariViewController(url: url)
        present(webView, animated: true, completion: nil)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
