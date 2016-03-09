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
        self.tableView.backgroundColor = UIColor.blackColor()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
}

// MARK: - TableView Delegate, Datasource
extension WritingsViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.textColor = UIColor.whiteColor()
        switch indexPath.row {
        case 0 :
            cell.textLabel?.text = "Unilateral Training"
        case 1 :
            cell.textLabel?.text = "Interval Training"
        case 2 :
            cell.textLabel?.text = "Insulin Resistance"
        default :
            break
        }
        cell.backgroundColor = UIColor.blackColor()
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}