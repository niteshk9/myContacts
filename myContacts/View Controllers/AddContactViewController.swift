//
//  AddContactViewController.swift
//  myContacts
//
//  Created by Nitesh Kumar Singh on 05/09/22.
//

import UIKit

protocol AddContactViewControllerProtocol : AnyObject {
    func updateData ()
}

class AddContactViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    
    var newContact : Contacts = .init(firstName: "", lastName: "", phoneNumber: "", email: "")
    weak var delegate : AddContactViewControllerProtocol?
    
    override func viewDidLoad() {
        configureNavigation()
        registerCell()
        myTableView.dataSource = self
        myTableView.delegate = self
        
        
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:))))
    }

//    override func viewWillDisappear(_ animated: Bool) {
//        let showAddedContactDetail = storyboard?.instantiateViewController(withIdentifier: "ContactDetailsViewController") as! ContactDetailsViewController
//        showAddedContactDetail.contactToShow = newContact
//        navigationController?.pushViewController(showAddedContactDetail, animated: true)
//    }
//    override func viewWillDisappear(_ animated: Bool) {
//        let showAddedContactDetail = storyboard?.instantiateViewController(withIdentifier: "ContactDetailsViewController") as! ContactDetailsViewController
//        showAddedContactDetail.contactToShow = newContact
//        navigationController?.pushViewController(showAddedContactDetail, animated: true)
//    }
    
}



extension AddContactViewController {
    
    func configureNavigation() {
        super.viewDidLoad()
        self.title = "New Contact"
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(saveAddedContact)) //add selector function here to append the data in the array when user presses done
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(popAddContactsVC))
        navigationItem.rightBarButtonItems = [doneButton]
        navigationItem.leftBarButtonItems = [cancelButton]
        
    
    }
    
    @objc func popAddContactsVC() {
        navigationController?.popViewController(animated: true)
        self.dismiss(animated: true)
    }
    
    @objc func saveAddedContact() {
        
        self.view.endEditing(true)
        
        if contactDict[String(newContact.firstName.first!)] != nil {
            contactDict[String(newContact.firstName.first!)]?.append(newContact)
        } else {
            contactDict[String(newContact.firstName.first!)] = [newContact]
        }
        delegate?.updateData()
        navigationController?.popViewController(animated: true)
        self.dismiss(animated: true)
//        let showAddedContactDetail = storyboard?.instantiateViewController(withIdentifier: "ContactDetailsViewController") as! ContactDetailsViewController
//        showAddedContactDetail.contactToShow = newContact
//        showAddedContactDetail.modalPresentationStyle = .fullScreen
//        navigationController?.pushViewController(showAddedContactDetail, animated: true)
    }
    
    
    func registerCell() {
        let nib = UINib(nibName: "NewContactsTableViewCell", bundle: nil)
        myTableView.register(nib, forCellReuseIdentifier: "NewContactsTableViewCell")
        
    }
}


extension AddContactViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : NewContactsTableViewCell = myTableView.dequeueReusableCell(withIdentifier: "NewContactsTableViewCell") as! NewContactsTableViewCell
        cell.firstNameTextField.delegate = self
        cell.firstNameTextField.tag = 1
        cell.lastNameTextField.delegate = self
        cell.lastNameTextField.tag = 2
        cell.phoneNumberTextField.delegate = self
        cell.phoneNumberTextField.tag = 3
        cell.emailTextField.delegate = self
        cell.emailTextField.tag = 4
        return cell
    }
}


extension AddContactViewController : UITextFieldDelegate, UITableViewDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 1 {
            newContact.firstName = textField.text ?? ""
        } else if textField.tag == 2 {
            newContact.lastName = textField.text ?? ""
        } else if textField.tag == 3 {
            newContact.phoneNumber = textField.text ?? ""
        } else if textField.tag == 4 {
            newContact.email = textField.text ?? ""
        }
    }
    
}
