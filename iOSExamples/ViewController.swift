//
//  ViewController.swift
//  iOSExamples
//
//  Created by Mitsuaki Ihara on 2017/10/09.
//  Copyright © 2017年 Mitsuaki Ihara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func touchCollectionInTableButton(_ sender: Any) {
        presentVc(vc: CollectionInTableViewController())
    }
    @IBAction func touchDisplayOutputButton(_ sender: Any) {
        presentVc(vc: DisplayOutputViewController())
    }
    @IBAction func touchMediaPlayerButton(_ sender: Any) {
        presentVc(vc: MediaPlayer())
    }
    
    private func presentVc(vc: UIViewController) {
        present(vc, animated: false, completion: nil)
    }
}
