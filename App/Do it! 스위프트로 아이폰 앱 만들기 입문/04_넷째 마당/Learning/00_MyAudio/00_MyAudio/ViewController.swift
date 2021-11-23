//
//  ViewController.swift
//  00_MyAudio
//
//  Created by Deforeturn on 11/23/21.
//

import UIKit
import AVFoundation
class ViewController: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate {
    // MARK: - MyEle
    var audioPlayer: AVAudioPlayer!
    var audioFile: URL!
    let MAX_VOLUME: Float = 10.0
    
    var progressTimer: Timer!
    
    var audioRecorder: AVAudioRecorder!
    var isRecordMode = false
    
    // MARK: - IBOutlet
    @IBOutlet var pvProgressPlay: UIProgressView!
    @IBOutlet var lbCurrentTime: UILabel!
    @IBOutlet var lbEndTime: UILabel!
    @IBOutlet var btnPlay: UIButton!
    @IBOutlet var btnPause: UIButton!
    @IBOutlet var btnStop: UIButton!
    @IBOutlet var slVolume: UISlider!
    
    @IBOutlet var btnRecord: UIButton!
    @IBOutlet var lbRecordTime: UILabel!
    // MARK: - Controll
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        selectAudioFile()
        if !isRecordMode{
            initPlayer()
            btnRecord.isEnabled = false
            lbRecordTime.isEnabled = false
        }else{
            initRecord()
        }
    }
    
    
    // MARK: - IBAction
    let timePlayerSelector = #selector(ViewController.updatePlayTime)
    let timeRecordSelector = #selector(ViewController.updateRecordTime)
    
    @IBAction func btnPlayAudio(_ sender: UIButton) {
        audioPlayer.play()
        setPlayButtons(false, true, true)
        progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timePlayerSelector, userInfo: nil, repeats: true)
    }
    @IBAction func btnPauseAudio(_ sender: UIButton) {
        audioPlayer.pause()
        setPlayButtons(true, false, true)
    }
    @IBAction func btnStopAudio(_ sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.currentTime = 0
        lbCurrentTime.text = convertNSTimeInterval2String(0)
        progressTimer.invalidate()
        setPlayButtons(true, true, false)
    }
    @IBAction func slChangeVolume(_ sender: UISlider) {
        audioPlayer.volume = slVolume.value
    }
    
    @IBAction func swRecordMode(_ sender: UISwitch) {
        if sender.isOn{
            audioPlayer.stop()
            audioPlayer.currentTime = 0
            lbRecordTime.text = convertNSTimeInterval2String(0)
            isRecordMode = true
            btnRecord.isEnabled = true
            lbRecordTime.isEnabled = true
        }else{
            isRecordMode = false
            btnRecord.isEnabled = false
            lbRecordTime.isEnabled = false
            lbRecordTime.text = convertNSTimeInterval2String(0)
        }
        
        selectAudioFile()
        if !isRecordMode{
            initPlayer()
        }else{
            initRecord()
        }
    }
    @IBAction func btnRecord(_ sender: UIButton) {
        if (sender as AnyObject).titleLabel?.text == "Record"{
            audioRecorder.record()
            (sender as AnyObject).setTitle("Stop", for: UIControl.State())
            progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timeRecordSelector, userInfo: nil, repeats: true)
            
        }else{
            audioRecorder.stop()
            (sender as AnyObject).setTitle("Record", for: UIControl.State())
            btnPlay.isEnabled = true
            initPlayer()
        }
    }
    
    
    // MARK: - MyFunc
    func initPlayer(){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: audioFile)
        }catch let error as NSError{
            print("Error-initPlay: \(error)")
        }
        slVolume.maximumValue = MAX_VOLUME
        slVolume.value = 1.0
        pvProgressPlay.progress = 0
        
        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()
        audioPlayer.volume = slVolume.value
        lbEndTime.text = convertNSTimeInterval2String(audioPlayer.duration)
        lbCurrentTime.text = convertNSTimeInterval2String(0)
        setPlayButtons(true, false, false)
    }
    func initRecord(){
        let recordSettings = [
            AVFormatIDKey: NSNumber(value: kAudioFormatAppleLossless as UInt32),
            AVEncoderAudioQualityKey: AVAudioQuality.max.rawValue,
            AVEncoderBitRateKey: 320000,
            AVNumberOfChannelsKey: 2,
            AVSampleRateKey: 44100.0] as [String:Any]
        do{
            audioRecorder = try AVAudioRecorder(url: audioFile, settings: recordSettings)
        }catch let error as NSError{
            print("Error-initRecord: \(error)")
        }
        audioRecorder.delegate = self
        
        slVolume.value = 1.0
        audioPlayer.volume = slVolume.value
        lbEndTime.text = convertNSTimeInterval2String(0)
        lbCurrentTime.text = convertNSTimeInterval2String(0)
        setPlayButtons(false, false, false)
        
        let session = AVAudioSession.sharedInstance()
        do{
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        }catch let error as NSError{
            print("Error-setCategory: \(error)")
        }
        do{
            try session.setActive(true)
        }catch let error as NSError{
            print("Error-setActive: \(error)")
        }
    }
    func convertNSTimeInterval2String(_ time: TimeInterval) -> String{
        let min = Int(time/60)
        let sec = Int(time.truncatingRemainder(dividingBy: 60))
        let strTime = String(format: "%02d:%02d", min, sec)
        return strTime
    }
    
    func setPlayButtons(_ play:Bool,_ pause:Bool,_ stop:Bool){
        btnPlay.isEnabled = play
        btnPause.isEnabled = pause
        btnStop.isEnabled = stop
    }
    @objc func updatePlayTime(){
        lbCurrentTime.text = convertNSTimeInterval2String(audioPlayer.currentTime)
        pvProgressPlay.progress = Float(audioPlayer.currentTime/audioPlayer.duration)
    }
    @objc func updateRecordTime(){
        lbRecordTime.text = convertNSTimeInterval2String(audioRecorder.currentTime)
    }
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        progressTimer.invalidate()
        setPlayButtons(true, false, false)
    }
    func selectAudioFile(){
        if !isRecordMode{
            audioFile = Bundle.main.url(forResource: "Sicilian_Breeze", withExtension: "mp3")
        }else{
            let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            audioFile = documentDirectory.appendingPathComponent("recordFile.m4a")
        }
    }
}

