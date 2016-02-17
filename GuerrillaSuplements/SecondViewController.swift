//
//  SecondViewController.swift
//  GuerrillaSuplements
//
//  Created by Tyler Lafferty on 2/15/16.
//  Copyright © 2016 Tyler Lafferty. All rights reserved.
//

import UIKit
import MessageUI

class SecondViewController: UIViewController {
    
    // Outlets
    @IBOutlet var headerView: UIView!
    @IBOutlet var tableView: UITableView!
    
    // Vars
    var errorMessage: String! = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: Helpers
extension SecondViewController {
    @IBAction func submitTapped(sender: UIButton) {
        if checkTextFields() {
            let name = getStringFromCell(0)
            let email = getStringFromCell(1)
            let subject = getStringFromCell(2)
            let message = getStringFromCell(3)
            let toRecipents = ["tylerlafferty4@gmail.com"]
            let mc = MFMailComposeViewController()
            mc.mailComposeDelegate = self
            mc.setSubject(subject)
            mc.setMessageBody("Name: \(name) \nEmail: \(email) \n\nMessage: \(message)", isHTML: false)
            mc.setToRecipients(toRecipents)
            self.presentViewController(mc, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Error", message: "Please fill out all fields", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.showViewController(alert, sender: self)
        }
    }
    
    func getStringFromCell(row : Int) -> String {
        if row == 3 {
            let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 3, inSection: 0)) as! ContactUsViewTableViewCell
            if let str = cell.infoTextView.text {
                return str
            }
        } else {
            let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: row, inSection: 0)) as! ContactUsFieldsTableViewCell
            if let str = cell.infoTextField.text {
                return str
            }
        }
        return ""
    }
    
    func checkTextFields() -> Bool {
        for var i=0; i<=3; i++ {
            if i == 3 {
                let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: i, inSection: 0)) as! ContactUsViewTableViewCell
                if let str = cell.infoTextView.text {
                    if str == "" {
                        return false
                    }
                }
            } else {
                let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: i, inSection: 0)) as! ContactUsFieldsTableViewCell
                if let str = cell.infoTextField.text {
                    if str == "" {
                        return false
                    }
                }
            }
        }
        return true
    }
}

// MARK: MFMailCompose Delegate
extension SecondViewController : MFMailComposeViewControllerDelegate {
    func mailComposeController(controller:MFMailComposeViewController, didFinishWithResult result:MFMailComposeResult, error:NSError?) {
        switch result {
        case MFMailComposeResultCancelled:
            print("Mail cancelled")
        case MFMailComposeResultSaved:
            print("Mail saved")
        case MFMailComposeResultSent:
            print("Mail sent")
        case MFMailComposeResultFailed:
            print("Mail sent failure: %@", [error!.localizedDescription])
        default:
            break
        }
        self.dismissViewControllerAnimated(false, completion: nil)
    }
}

// MARK: Table View Delegate and Datasource
extension SecondViewController : UITableViewDataSource, UITableViewDelegate {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 3 {
            return 200
        }
        return 90
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("fieldCell", forIndexPath: indexPath) as! ContactUsFieldsTableViewCell
            cell.titleLbl.text = "Name:"
            return cell
        case 1:
            let cell = tableView.dequeueReusableCellWithIdentifier("fieldCell", forIndexPath: indexPath) as! ContactUsFieldsTableViewCell
            cell.titleLbl.text = "Email:"
            cell.infoTextField.keyboardType = .EmailAddress
            return cell
        case 2:
            let cell = tableView.dequeueReusableCellWithIdentifier("fieldCell", forIndexPath: indexPath) as! ContactUsFieldsTableViewCell
            cell.titleLbl.text = "Subject:"
            return cell
        case 3:
            let cell = tableView.dequeueReusableCellWithIdentifier("viewCell", forIndexPath: indexPath) as! ContactUsViewTableViewCell
            cell.titleLbl.text = "Message:"
            return cell
        default:
            return UITableViewCell()
        }
    }
}

// MARK: Text View Delegate
extension SecondViewController : UITextViewDelegate, UITextFieldDelegate {
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        
    }
}

