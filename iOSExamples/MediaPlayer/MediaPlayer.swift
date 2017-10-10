//
//  MediaPlayer.swift
//  iOSExamples
//
//  Created by m-ihara on 2017/10/10.
//  Copyright © 2017年 Mitsuaki Ihara. All rights reserved.
//

import AVKit
import AVFoundation

class MediaPlayer: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(type: .system)
        view.addSubview(button)
        
        button.setTitle("Play", for: .normal)
        button.addTarget(self, action: #selector(self.playMovieFromProjectBundle), for: .touchUpInside)
        button.sizeToFit()
        button.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        button.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        button.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
        playMovieFromProjectBundle()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        playMovieFromProjectBundle()
    }
    
    @objc private func playMovieFromProjectBundle() {
        
        guard let asset = NSDataAsset(name: "DisplayVideo.m4v") else { return }
        guard let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else { return }
        
        let videoPath = documentDirectory + "/DisplayVideo.m4v"
        let videoUrl = URL(fileURLWithPath: videoPath)
        try! asset.data.write(to: videoUrl, options: .atomicWrite)
        
        let playerItem = AVPlayerItem(url: videoUrl)
        let videoPlayer = AVPlayer(playerItem: playerItem)
        
        let playerController = AVPlayerViewController()
        playerController.player = videoPlayer
        playerController.delegate = self
        self.present(playerController, animated: true, completion: {
            videoPlayer.play()
        })
    }
    
    private func getDocumentDirectory() -> String {
        return NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension MediaPlayer: AVPlayerViewControllerDelegate {
    
    func playerViewControllerDidStopPictureInPicture(_ playerViewController: AVPlayerViewController) {
    }
    
    func playerViewControllerDidStartPictureInPicture(_ playerViewController: AVPlayerViewController) {
    }
    
    func playerViewControllerWillStopPictureInPicture(_ playerViewController: AVPlayerViewController) {
    }
    
    func playerViewControllerWillStartPictureInPicture(_ playerViewController: AVPlayerViewController) {
    }
    
    func playerViewController(_ playerViewController: AVPlayerViewController, failedToStartPictureInPictureWithError error: Error) {
    }
    
    func playerViewControllerShouldAutomaticallyDismissAtPictureInPictureStart(_ playerViewController: AVPlayerViewController) -> Bool {
        return true;
    }
    
    func playerViewController(_ playerViewController: AVPlayerViewController, restoreUserInterfaceForPictureInPictureStopWithCompletionHandler completionHandler: @escaping (Bool) -> Void) {
    }
}
