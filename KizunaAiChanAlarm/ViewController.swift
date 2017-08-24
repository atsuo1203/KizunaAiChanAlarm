//
//  ViewController.swift
//  KizunaAiChanAlarm
//
//  Created by Atsuo Yonehara on 2017/08/25.
//  Copyright © 2017年 Atsuo Yonehara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var setTimeLabel: UILabel!
    @IBOutlet weak var dataPicker: UIDatePicker!
    @IBOutlet weak var setAlarmImageView: UIImageView!
    @IBOutlet weak var cancelImageView: UIImageView!
    
    var isWakeUp = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        timer.fire()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getNowTime()-> String {
        // 現在時刻を取得
        let nowTime: NSDate = NSDate()
        // 成形する
        let format = DateFormatter()
        format.dateFormat = "HH:mm"
        let nowTimeStr = format.string(from: nowTime as Date)
        // 成形した時刻を文字列として返す
        return nowTimeStr
    }
    
    //毎回ならす処理
    func update() {
        let str = getNowTime()
        ringAlarm(str: str)
    }
    
    //Alarm鳴らすかどうか
    func ringAlarm(str: String) {
        // 現在時刻が設定時刻と一緒なら
        if str == setTimeLabel.text && !isWakeUp {
            alert()
        }
    }
    
    func alert() {
        self.isWakeUp = true
        print("isWakeup")
        let alert = UIAlertController(title: "alert", message: "ring ding", preferredStyle: .alert)
        let action = UIAlertAction(title: "時間です", style: .default) { action in
            print("はいどーも")
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

}

