//
//  WebsiteViewController.swift
//  KizunaAiChanAlarm
//
//  Created by Atsuo Yonehara on 2017/09/19.
//  Copyright © 2017年 Atsuo Yonehara. All rights reserved.
//

import UIKit

class WebsiteViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var fowardImageView: UIImageView!
    @IBOutlet weak var reloadImageView: UIImageView!
    
    let targetURL = "https://kizunaai.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupSwipeGestures()
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
    
    func setupSwipeGestures() {
        //右ボタンにジェスチャー
        let rightButtonGesture = UITapGestureRecognizer(target: self, action: #selector(self.goForward))
        fowardImageView.isUserInteractionEnabled = true
        fowardImageView.addGestureRecognizer(rightButtonGesture)
        
        //左ボタンにジェスチャー
        let leftButtonGesture = UITapGestureRecognizer(target: self, action: #selector(self.goBack))
        backImageView.isUserInteractionEnabled = true
        backImageView.addGestureRecognizer(leftButtonGesture)
        
        //リロードボタンにジェスチャー
        let reloadButtonGesture = UITapGestureRecognizer(target: self, action: #selector(self.reloadRequest))
        reloadImageView.isUserInteractionEnabled = true
        reloadImageView.addGestureRecognizer(reloadButtonGesture)
        
    }
    
    func goBack() {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    func goForward() {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    func reloadRequest(){
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
