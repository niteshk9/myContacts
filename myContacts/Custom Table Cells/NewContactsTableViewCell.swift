//
//  NewContactsTableViewCell.swift
//  myContacts
//
//  Created by Nitesh Kumar Singh on 05/09/22.
//

import UIKit

class NewContactsTableViewCell: UITableViewCell {

    var newContact : Contacts?
    
    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        detailsView.layer.borderWidth = 0.4
        detailsView.layer.borderColor = UIColor.lightGray.cgColor
        
        firstNameTextField.autocapitalizationType = .sentences
        lastNameTextField.autocapitalizationType = .sentences
        phoneNumberTextField.keyboardType = .numberPad
        emailTextField.keyboardType = .emailAddress
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
}

