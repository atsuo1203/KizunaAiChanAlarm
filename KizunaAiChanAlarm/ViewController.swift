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
    @IBAction func dataPickerAction(_ sender: UIDatePicker) {
        // DPの値を成形
        let format = DateFormatter()
        format.dateFormat = "HH:mm"
        // 一時的にDPの値を保持
        tempTime = format.string(from: dataPicker.date)
    }
    @IBAction func setAlarmButtonPushed(_ sender: UIButton) {
        // アラームをセット
        setTimeLabel.text = tempTime
        print("aaaa")
    }
    @IBAction func cancelButtonPushed(_ sender: UIButton) {
    }
    
    var isWakeUp = false
    
    //時間を一時的に保存
    var tempTime: String = "00:00"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //時間ごとにupdate()を呼び出すための設定
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

