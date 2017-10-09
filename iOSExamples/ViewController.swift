//
//  ViewController.swift
//  iOSExamples
//
//  Created by Mitsuaki Ihara on 2017/10/09.
//  Copyright © 2017年 Mitsuaki Ihara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let vc = DisplayOutputViewController()
        present(vc, animated: false, completion: nil)
    }
}

