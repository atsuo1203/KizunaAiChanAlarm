//
//  MainTabController.swift
//  KizunaAiChanAlarm
//
//  Created by Atsuo Yonehara on 2017/09/19.
//  Copyright © 2017年 Atsuo Yonehara. All rights reserved.
//

import UIKit
import SafariServices

class MainTabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var viewControllers: [UIViewController] = []
        
        let alarmStoryboard = UIStoryboard(name: "Alarm", bundle: nil)
        let alarmViewController = alarmStoryboard.instantiateInitialViewController()
        viewControllers.append(alarmViewController!)
        
        let webStoryboard = UIStoryboard(name: "Website", bundle: nil)
        let webViewController = webStoryboard.instantiateInitialViewController()
        viewControllers.append(webViewController!)
        
        self.setViewControllers(viewControllers, animated: false)
        
        // Do any additional setup after loading the view.
    }

    func showWebView() {
        let url = URL(string: "https://www.google.com")!
        let webView = SFSafariViewController(url: url)
        present(webView, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
