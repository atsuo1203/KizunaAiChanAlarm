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

        let firstStoryboard = UIStoryboard(name: "Alarm", bundle: nil)
        let firstViewController = firstStoryboard.instantiateInitialViewController()!
        firstViewController.title = "Alarm"
        let navigationControllerFirst = UINavigationController(rootViewController: firstViewController)
        viewControllers.append(navigationControllerFirst)
        
        let secondStoryboard = UIStoryboard(name: "Website", bundle: nil)
        let secondViewController = secondStoryboard.instantiateInitialViewController()!
        secondViewController.title = "Website"
        let navigationControllerSecond = UINavigationController(rootViewController: secondViewController)
        viewControllers.append(navigationControllerSecond)
        
        let thirdStoryboard = UIStoryboard(name: "Twitter", bundle: nil)
        let thirdViewController = thirdStoryboard.instantiateInitialViewController()!
        thirdViewController.title = "Twitter"
        let navigationControllerThird = UINavigationController(rootViewController: thirdViewController)
        viewControllers.append(navigationControllerThird)

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
