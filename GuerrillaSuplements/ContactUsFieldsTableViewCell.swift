//
//  ContactUsFieldsTableViewCell.swift
//  GuerrillaSuplements
//
//  Created by Tyler Lafferty on 2/15/16.
//  Copyright © 2016 Tyler Lafferty. All rights reserved.
//

import UIKit

class ContactUsFieldsTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var infoTextField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}

class ContactUsViewTableViewCell: UITableViewCell {
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var infoTextView: UITextView!
}
