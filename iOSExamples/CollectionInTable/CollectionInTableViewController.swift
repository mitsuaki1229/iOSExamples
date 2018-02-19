//
//  CollectionInTableViewController.swift
//  iOSExamples
//
//  Created by Mitsuaki Ihara on 2018/02/17.
//  Copyright © 2018年 Mitsuaki Ihara. All rights reserved.
//

import UIKit

class CollectionInTableViewController: UIViewController {
    
    let viewModel = CollectionInTableViewModel()
    
    override func loadView() {
        view = CollectionInTableView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = self.view as! CollectionInTableView
        view.tableView.delegate = self
        view.tableView.dataSource = viewModel
    }
}

extension CollectionInTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
