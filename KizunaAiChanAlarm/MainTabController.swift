//
//  MainTabController.swift
//  KizunaAiChanAlarm
//
//  Created by Atsuo Yonehara on 2017/09/19.
//  Copyright © 2017年 Atsuo Yonehara. All rights reserved.
//

import UIKit

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
        
        self.setViewControllers(viewControllers, animated: false)
        
        // Do any additional setup after loading the view.
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
