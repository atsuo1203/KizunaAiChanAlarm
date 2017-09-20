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
        let firstViewController = firstStoryboard.instantiateInitialViewController()
        viewControllers.append(firstViewController!)
        
        let secondStoryboard = UIStoryboard(name: "AIChannel", bundle: nil)
        let secondViewController = secondStoryboard.instantiateInitialViewController()
        viewControllers.append(secondViewController!)
        
        let thirdStoryboard = UIStoryboard(name: "Website", bundle: nil)
        let thirdViewController = thirdStoryboard.instantiateInitialViewController()
        viewControllers.append(thirdViewController!)

        let viewController = UIViewController()
        viewController.view.backgroundColor = .red
        let button = UIButton(frame: CGRect(x: 100, y: 200, width: 200, height: 50))
        button.setTitle("Button", for: .normal)
        button.addTarget(self, action: #selector(showWebView), for: .touchUpInside)
        viewController.view.addSubview(button)
        viewControllers.append(viewController)
        
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
