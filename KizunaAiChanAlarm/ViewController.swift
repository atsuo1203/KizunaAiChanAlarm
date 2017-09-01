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
        getSnoozeTime(nowTime: dataPicker.date, dateForMatter: format)
        resetAll()
        isSetAlarm = true
    }
    @IBAction func resetAlarmButtonPushed(_ sender: UIButton) {
        setTimeLabel.text = defaultTime
        //セットされている状態でセット解除を押すとき起動
        if isSetAlarm {
            saisei(forResource: "hayaoki")
        }
        resetAll()
        isSetAlarm = false
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
    
    // アラームがセットされているかどうか
    var isSetAlarm = false {
        didSet {
            UIDevice.current.isProximityMonitoringEnabled = isSetAlarm
            UIApplication.shared.isIdleTimerDisabled = isSetAlarm
        }
    }
    //スヌーズをオンにしてるかどうか
    var isSnooze = true
    //~分後
    let snoozeTime = [1,2]
    //スヌーズの時刻 現在時刻 + snoozeTime
    var snoozeClock = [""]
    
    //アラートが呼ばれたかどうか
    var isAlartCalled = false
    //アラートのボタンを押した時、起きたとみなす
    var isWakeUp = false
    
    //最初に表示される時刻
    let defaultTime = "--:--"
    
    //サウンド関係
    var audioPlayer : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //初期化
        setTimeLabel.text = defaultTime
        resetAll()
        dataPicker.datePickerMode = .time
        isSetAlarm = false
        
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
        let nowTime: Date = Date()
        // 成形する
        let format = DateFormatter()
        format.dateFormat = "HH:mm"
        let nowTimeStr = format.string(from: nowTime)
        // 成形した時刻を文字列として返す
        return nowTimeStr
    }
    
    //snoozeClockを作成していく処理 snoozeTimeの配列分作成される
    func getSnoozeTime(nowTime: Date, dateForMatter: DateFormatter) {
        self.snoozeClock.removeAll()
        self.snoozeTime.forEach { (time) in
            let clock = Date(timeInterval: TimeInterval(time * 60), since: nowTime)
            self.snoozeClock.append(dateForMatter.string(from: clock))
        }
        print(self.snoozeClock)
    }
    
    //毎回ならす処理
    func update() {
        let nowTime = getNowTime()
        ringAlarm(nowTime: nowTime)
    }
    
    //Alarm鳴らすかどうか
    func ringAlarm(nowTime: String) {
        // 現在時刻が設定時刻と一緒なら
        if nowTime == setTimeLabel.text && !isAlartCalled {
            saisei(forResource: "default")
            alert()
        }
        //snoozeClockが一つもなくなった時に落ちないための対処
        var clock = ""
        if self.snoozeClock.count != 0 {
            clock = self.snoozeClock[0]
        } else {
            clock = ""
        }
        print("self.snoozeClock.count 前")
        print(self.snoozeClock.count)
        print("clock")
        print(clock)
        //snooze機能 snooze時刻なおかつ起きてない時に起動 snoozeTimeの個数分呼ばれる
        if nowTime == clock && !isWakeUp && isSetAlarm {
            print("self.snoozeClock.count 中")
            print(self.snoozeClock.count)
            //最後だけ別音声鳴らしたい！
            if self.snoozeClock.count == 1 {
                saisei(forResource: "default")
            } else {
                saisei(forResource: "snooze")
            }
            self.snoozeClock.removeFirst()
            clock = ""
            print("self.snoozeClock.count 後")
            print(self.snoozeClock.count)
        }
    }
    
    func alert() {
        self.isAlartCalled = true
        let alert = UIAlertController(title: "はいどーも！こんにちわ！", message: "バーチャルYouTuberの", preferredStyle: .alert)
        let action = UIAlertAction(title: "キズナアイです！", style: .default) { action in
            self.audioPlayer.stop()
            self.isWakeUp = true
            self.saisei(forResource: "wakeUp")
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    // 声の再生メソッド
    func saisei(forResource: String) {
        // 再生する音源のURLを生成
        let soundFilePath : String = Bundle.main.path(forResource: forResource, ofType: "m4a")!
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
    
    //判定のリセット
    func resetAll(){
        isAlartCalled = false
        isWakeUp = false
        isSetAlarm = false
    }
    
    //近接した時に呼ばれる
    func proxitySensorStateChanged(){
        if (UIDevice.current.proximityState == true)
        {
            print("近い！")
        }
        else
        {
            print("遠い")
        }
    }
}

