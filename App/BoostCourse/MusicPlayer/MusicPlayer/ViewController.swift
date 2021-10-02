//
//  ViewController.swift
//  MusicPlayer
//
//  Created by KANG SEUNG HOON on 2021/10/02.
//

import UIKit
import AVFoundation


class ViewController: UIViewController, AVAudioPlayerDelegate  {
    // MARK: Properties
    var player:AVAudioPlayer!
    var timer:Timer!
    
    // MARK: IBOutlets
    @IBOutlet var playPauseButton:UIButton!
    @IBOutlet var timeLabel:UILabel!
    @IBOutlet var progressSlider:UISlider!
    
    // MARK: - Custom Method
    func initializePlayer(){
        guard let soudAsset:NSDataAsset = NSDataAsset(name:"sound") else{
            print("Unable to import the music file asset.")
            return
        }
        do {
            try self.player = AVAudioPlayer(data:soudAsset.data)
            self.player.delegate = self
        } catch let error as NSError{
            print("Player initialization failed.")
            print("Code : \(error.code)\nMessage : \(error.localizedDescription)")
        }
        self.progressSlider.maximumValue = Float(self.player.duration)
        self.progressSlider.minimumValue = 0
        self.progressSlider.value = Float(self.player.currentTime)
    }
    
    func updateTimeLabelText(time: TimeInterval){
        let minute = Int(time/60)
        let second = Int(time.truncatingRemainder(dividingBy: 60))
        let milisecond = Int(time.truncatingRemainder(dividingBy: 1)*100)
        let timeText = String(format:"%02ld:%02ld:%02ld", minute, second, milisecond)
        self.timeLabel.text = timeText
    }
    func makeAndFireTimer(){
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: {
            [self] (timer: Timer) in
            if self.progressSlider.isTracking{return}
            self.updateTimeLabelText(time: self.player.currentTime)
            self.progressSlider.value = Float(self.player.currentTime)
        })
        self.timer.fire()
    }
    func invalidateTimer() {
        self.timer.invalidate()
        self.timer = nil
    }
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        guard let error = error else {
            print("Audio player decode error.")
            return
        }
        let message:String
        message = "Audio Player error. \(error.localizedDescription)"
        
        let alert = UIAlertController(title:"Notification", message: message,
                                      preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Check", style: UIAlertAction.Style.default){
            (action:UIAlertAction) -> Void in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        self.playPauseButton.isSelected = false
        self.progressSlider.value = 0
        self.updateTimeLabelText(time: 0)
        self.invalidateTimer()
    }
    
    // MARK: -
    // MARK: IBActions
    @IBAction func touchUpPlayPauseButton(_ sender:UIButton){
        print("Button touch.")
        sender.isSelected = !sender.isSelected
        if sender.isSelected{
            self.player?.play()
            self.makeAndFireTimer()
        }else{
            self.player?.pause()
            self.invalidateTimer()
        }
    }
    
    @IBAction func sliderValueChanged(_ sender:UISlider){
        print("Slider value Changed.")
        self.updateTimeLabelText(time: TimeInterval(sender.value))
        if sender.isTracking {return}
        self.player.currentTime = TimeInterval(sender.value)
    }
    
    // MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializePlayer()
    }
}

