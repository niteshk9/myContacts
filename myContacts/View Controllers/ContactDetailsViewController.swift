//
//  ContactDetailsViewController.swift
//  myContacts
//
//  Created by Nitesh Kumar Singh on 05/09/22.
//

import UIKit

//protocol ContactDetailsDelegate: AnyObject {
//    func showData(initial1 : String, name1 : String, phone1 : String, email1 : String)
//}

class ContactDetailsViewController: UIViewController {

//    var initial = ""
//    var name = ""
//    var phone = ""
//    var email = ""
    var contactToShow: Contacts!

    @IBOutlet weak var myTableView: UITableView!
    
//    weak var delegate: ContactDetailsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigation()
        registerCell()
        
        myTableView.dataSource = self
        myTableView.delegate = self
        
//        delegate?.showData(initial1: "\(initial)", name1: "\(name)", phone1: "\(phone)", email1: "\(email)")
    
    }
    

}



extension ContactDetailsViewController {
    
    
    func configureNavigation() {
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItems = [editButton]
    }
    
    func registerCell() {
        let nib = UINib(nibName: "ContactDetailsTableViewCell", bundle: nil)
        myTableView.register(nib, forCellReuseIdentifier: "ContactDetailsTableViewCell")
        
    }
    
}

var array = Array<String>()

extension ContactDetailsViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "ContactDetailsTableViewCell") as! ContactDetailsTableViewCell
        cell.showData(contact: contactToShow)
        return cell
    }
    
}
