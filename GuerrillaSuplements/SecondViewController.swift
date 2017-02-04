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
    @IBOutlet var bottomConstraint: NSLayoutConstraint!
    @IBOutlet var topConstraint: NSLayoutConstraint!
    @IBOutlet var joinRevolutionImg: UIImageView!
    
    // Vars
    var errorMessage: String! = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(SecondViewController.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(SecondViewController.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        joinRevolutionImg.isUserInteractionEnabled = true
        joinRevolutionImg.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(SecondViewController.submitTapped)))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: Keyboard Movement
extension SecondViewController {
    func keyboardWillShow(_ notification: Notification) {
        self.bottomConstraint.constant = 210
    }
    
    func keyboardWillHide(_ notification: Notification) {
        self.bottomConstraint.constant = 0
    }
}

// MARK: Helpers
extension SecondViewController {
    func submitTapped() {
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
            self.present(mc, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Error", message: "Please fill out all fields", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.show(alert, sender: self)
        }
    }
    
    func getStringFromCell(_ row : Int) -> String {
        if row == 5 {
            let cell = tableView.cellForRow(at: IndexPath(row: 3, section: 0)) as! ContactUsViewTableViewCell
            if let str = cell.infoTextView.text {
                return str
            }
        } else if row == 3 {
            
        } else if row == 0 {
            // Do Nothing
        } else {
            let cell = tableView.cellForRow(at: IndexPath(row: row, section: 0)) as! ContactUsFieldsTableViewCell
            if let str = cell.infoTextField.text {
                return str
            }
        }
        return ""
    }
    
    func checkTextFields() -> Bool {
        for var i=0; i<=5; i += 1 {
            if i == 5 {
                let cell = tableView.cellForRow(at: IndexPath(row: i, section: 0)) as! ContactUsViewTableViewCell
                if let str = cell.infoTextView.text {
                    if str == "" {
                        return false
                    }
                }
            } else if i == 3 {
                
            } else if i == 0 {
                // Do Nothing
            } else {
                let cell = tableView.cellForRow(at: IndexPath(row: i, section: 0)) as! ContactUsFieldsTableViewCell
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
    func mailComposeController(_ controller:MFMailComposeViewController, didFinishWith result:MFMailComposeResult, error:Error?) {
        switch result {
        case MFMailComposeResult.cancelled:
            print("Mail cancelled")
        case MFMailComposeResult.saved:
            print("Mail saved")
        case MFMailComposeResult.sent:
            print("Mail sent")
        case MFMailComposeResult.failed:
            print("Mail sent failure: %@", [error!.localizedDescription])
        default:
            break
        }
        self.dismiss(animated: false, completion: nil)
    }
}

// MARK: Table View Delegate and Datasource
extension SecondViewController : UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath as NSIndexPath).row == 5 {
            return 200
        } else if (indexPath as NSIndexPath).row == 3 {
            return 50
        }
        return 90
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath as NSIndexPath).row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as! ContactUsHeaderCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "fieldCell", for: indexPath) as! ContactUsFieldsTableViewCell
            cell.titleLbl.text = "Name: *"
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "fieldCell", for: indexPath) as! ContactUsFieldsTableViewCell
            cell.titleLbl.text = "Email: *"
            cell.infoTextField.keyboardType = .emailAddress
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "checkboxCell", for: indexPath) as! ContactUsSliderCell
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "fieldCell", for: indexPath) as! ContactUsFieldsTableViewCell
            cell.titleLbl.text = "Subject: *"
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "viewCell", for: indexPath) as! ContactUsViewTableViewCell
            cell.titleLbl.text = "Message: *"
            return cell
        default:
            return UITableViewCell()
        }
    }
}

