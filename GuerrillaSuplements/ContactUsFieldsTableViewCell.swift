//
//  ContactUsFieldsTableViewCell.swift
//  GuerrillaSuplements
//
//  Created by Tyler Lafferty on 2/15/16.
//  Copyright © 2016 Tyler Lafferty. All rights reserved.
//

import UIKit

class ContactUsSliderCell: UITableViewCell {
    @IBOutlet var slider: UISwitch!
    @IBOutlet var titleLbl: UILabel!
}

class ContactUsHeaderCell: UITableViewCell {
    @IBOutlet var titleLbl: UILabel!
}

class ContactUsFieldsTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var infoTextField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        infoTextField.delegate = self
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

class ContactUsViewTableViewCell: UITableViewCell {
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var infoTextView: UITextView!
}
