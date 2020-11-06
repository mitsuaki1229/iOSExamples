//
//  DisplayOutputViewController.swift
//  iOSExamples
//
//  Created by m-ihara on 2017/09/29.
//  Copyright © 2017年 Mitsuaki Ihara. All rights reserved.
//

import UIKit

class DisplayOutputViewController: UIViewController {
    
    var subWindow:UIWindow?
    let descriptionLabel = UILabel()
    let inductionxMessage = "Please connect external display."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(descriptionLabel)
        descriptionLabel.text = inductionxMessage
        descriptionLabel.textColor = .white
        descriptionLabel.textAlignment = .center
        descriptionLabel.backgroundColor = UIColor.blue
        descriptionLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.screenDidConnect(_:)),
                                               name: UIScreen.didConnectNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.screenDidDisconnect(_:)),
                                               name: UIScreen.didDisconnectNotification, object: nil)
    }
    
    @objc private func screenDidConnect(_: NSNotification) {
        creartSubDisplay()
    }
    
    @objc private func screenDidDisconnect(_: NSNotification) {
        closeSubDisplay()
    }
    
    private func creartSubDisplay() {
        subWindow = createSubWindow()
        
        descriptionLabel.text = "Screen connect."
    }
    
    private func closeSubDisplay() {
        subWindow = nil
        
        descriptionLabel.text = inductionxMessage
    }
    
    private func createSubWindow() -> UIWindow? {
        
        let screens = UIScreen.screens;
        guard screens.count > 1 else { return nil }
        
        let screen = screens[1];
        screen.currentMode = screen.availableModes.last
        screen.overscanCompensation = .none
        
        var windowRect = screen.bounds
        var maxSize = CGSize.zero
        
        for current in screen.availableModes {
            guard current.size.width > maxSize.width else { continue }
            maxSize  = current.size
            screen.currentMode = current
            windowRect = CGRect(x: 0, y: 0, width: maxSize.width, height: maxSize.height)
        }
        
        let window = UIWindow()
        
        window.frame = windowRect
        window.screen = screen
        
        let rootViewController = UIViewController()
        rootViewController.view.frame = CGRect(x: 0, y: 0, width: windowRect.width, height: windowRect.height)
        
        let displayImageView = UIImageView()
        rootViewController.view.addSubview(displayImageView)
        
        displayImageView.image = UIImage.init(named: "DisplayImage")
        displayImageView.contentMode = .scaleAspectFit
        displayImageView.topAnchor.constraint(equalTo: rootViewController.view.topAnchor).isActive = true
        displayImageView.leftAnchor.constraint(equalTo: rootViewController.view.leftAnchor).isActive = true
        displayImageView.rightAnchor.constraint(equalTo: rootViewController.view.rightAnchor).isActive = true
        displayImageView.bottomAnchor.constraint(equalTo: rootViewController.view.bottomAnchor).isActive = true
        displayImageView.translatesAutoresizingMaskIntoConstraints = false
        
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        
        return window
    }
}
