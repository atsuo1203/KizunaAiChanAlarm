//
//  AIChannelViewController.swift
//  KizunaAiChanAlarm
//
//  Created by Atsuo Yonehara on 2017/09/19.
//  Copyright © 2017年 Atsuo Yonehara. All rights reserved.
//

import UIKit

class AIChannelViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    let targetURL = "https://www.youtube.com/channel/UC4YaOt1yT-ZeyB0OmxHgolA/feed?activity_view=1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadAddressURL()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadAddressURL(){
        guard let requestURL = URL(string: targetURL) else { return }
        let request = URLRequest(url: requestURL)
        webView.loadRequest(request)
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
