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

    @IBOutlet weak var aichannelButton: UIButton!
    @IBOutlet weak var aigamesButton: UIButton!
    @IBOutlet weak var aigamersinfoButton: UIButton!
    @IBOutlet weak var officialwebsiteButton: UIButton!

    @IBAction func websiteButtonTapped(_ sender: UIButton) {
        var url = ""
        switch sender {
        case aichannelButton:
            url = "https://www.youtube.com/channel/UC4YaOt1yT-ZeyB0OmxHgolA"
        case aigamesButton:
            url = "https://www.youtube.com/channel/UCbFwe3COkDrbNsbMyGNCsDg"
        case aigamersinfoButton:
            url = "https://www.aigamers.info/"
        default:
            url = "https://kizunaai.com/"
        }
        showWebView(targetURL: url)
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
