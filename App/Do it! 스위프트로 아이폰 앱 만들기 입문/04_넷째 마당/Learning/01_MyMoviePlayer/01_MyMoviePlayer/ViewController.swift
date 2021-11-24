//
//  ViewController.swift
//  01_MyMoviePlayer
//
//  Created by Deforeturn on 11/24/21.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    
    // MARK: - Center.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: - Custom func.
    @IBAction func btnPlayInternalMovie(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "FastTyping", ofType: "mp4")
        let url = NSURL(fileURLWithPath: filePath!)
        playVideo(url: url)
    }
    @IBAction func btnPlayExternalMovie(_ sender: UIButton) {
        let url = NSURL(string: "https://dl.dropboxusercontent.com/s/e38auz050w2mvud/Fireworks.mp4")!
        playVideo(url: url)
    }
    
    func playVideo(url: NSURL){
        let playerController = AVPlayerViewController()
        let player = AVPlayer(url: url as URL)
        playerController.player = player
        self.present(playerController, animated: true, completion: {
            player.play()
        })
    }
}

