//
//  ViewController.swift
//  KizunaAiChanAlarm
//
//  Created by Atsuo Yonehara on 2017/08/25.
//  Copyright © 2017年 Atsuo Yonehara. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    @IBOutlet weak var setTimeLabel: UILabel!
    @IBOutlet weak var dataPicker: UIDatePicker!
    @IBAction func setAlarmButtonPushed(_ sender: UIButton) {
        let format = DateFormatter()
        format.dateFormat = "HH:mm"
        setTimeLabel.text = format.string(from: dataPicker.date)
        isWakeUp = false
    }
    @IBAction func resetAlarmButtonPushed(_ sender: UIButton) {
        setTimeLabel.text = defaultTime
        isWakeUp = false
    }
    @IBAction func modeSwitchTaped(_ sender: UISwitch) {
        if sender.isOn {
            print("on")
        } else {
            print("off")
        }
    }
    @IBAction func snoozeSwitchTaped(_ sender: UISwitch) {
        if sender.isOn {
            isSnooze = true
        } else {
            isSnooze = false
        }
    }
    
    var isSnooze = true {
        didSet {
            if isSnooze {
                print(isSnooze)
            } else {
                print(isSnooze)
            }
        }
    }
    var isWakeUp = false
    let defaultTime = "--:--"
    
    //サウンド関係
    var audioPlayer : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setTimeLabel.text = defaultTime
        isWakeUp = false
        
        //時間ごとにupdate()を呼び出すための設定
        let timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        timer.fire()
        
        dataPicker.datePickerMode = .time
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
            saisei()
            alert()
        }
    }
    
    func alert() {
        self.isWakeUp = true
        let alert = UIAlertController(title: "はいどーも！こんにちわ！", message: "バーチャルYouTuberの", preferredStyle: .alert)
        let action = UIAlertAction(title: "キズナアイです！", style: .default) { action in
            self.audioPlayer.stop()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    // 声の再生メソッド
    func saisei() {
        
        let fotResource = "default"
        // 再生する音源のURLを生成
        let soundFilePath : String = Bundle.main.path(forResource: fotResource, ofType: "m4a")!
        let fileURL : URL = URL(fileURLWithPath: soundFilePath)
        
        do{
            // AVAudioPlayerのインスタンス化
            audioPlayer = try AVAudioPlayer(contentsOf: fileURL)
            // AVAudioPlayerのデリゲートをセット
            audioPlayer.delegate = self
        }
        catch{
        }
        audioPlayer.volume = 2
        audioPlayer.play()
    }
}

