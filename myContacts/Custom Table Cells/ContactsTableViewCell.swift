//
//  ContactsTableViewCell.swift
//  myContacts
//
//  Created by Nitesh Kumar Singh on 05/09/22.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension ContactsTableViewCell {
    
    func showData(contact : Contacts) {
        nameLabel.text = "\(contact.firstName) \(contact.lastName)"
    }
    
}
