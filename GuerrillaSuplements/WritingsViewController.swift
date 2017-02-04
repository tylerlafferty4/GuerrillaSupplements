//
//  WritingsViewController.swift
//  GuerrillaSuplements
//
//  Created by Tyler Lafferty on 3/7/16.
//  Copyright © 2016 Tyler Lafferty. All rights reserved.
//

import Foundation
import UIKit

class WritingsViewController : UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = UIColor.black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

// MARK: - TableView Delegate, Datasource
extension WritingsViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.textColor = UIColor.white
        switch (indexPath as NSIndexPath).row {
        case 0 :
            cell.textLabel?.text = "Unilateral Training"
        case 1 :
            cell.textLabel?.text = "Interval Training"
        case 2 :
            cell.textLabel?.text = "Insulin Resistance"
        default :
            break
        }
        cell.backgroundColor = UIColor.black
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
