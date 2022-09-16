//
//  ContactDetailsTableViewCell.swift
//  myContacts
//
//  Created by Nitesh Kumar Singh on 05/09/22.
//

import UIKit

class ContactDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var initialsLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!

//    var initial = ""
//    var name = ""
//    var phone = ""
//    var email = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        initialsLabel.layer.cornerRadius = 40
        initialsLabel.layer.masksToBounds = true
        
//        func showData(initial : String, name : String, phone : String, email : String) {
//        initialsLabel.text = initial
//        nameLabel.text = name
//        phoneLabel.text = phone
//        emailLabel.text = email
//        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}

extension ContactDetailsTableViewCell {
    
    func showData(contact : Contacts) {
        if contact.lastName == "" {
            initialsLabel.text = "\(String(contact.firstName.first!))"
        } else {
            initialsLabel.text = "\(String(contact.firstName.first!))\(String(contact.lastName.first!))"
        }
        
        nameLabel.text = "\(contact.firstName) \(contact.lastName)"
        phoneLabel.text = "\(contact.phoneNumber)"
        emailLabel.text = contact.email
    }
}
