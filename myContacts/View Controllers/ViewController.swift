//
//  ViewController.swift
//  myContacts
//
//  Created by Nitesh Kumar Singh on 03/09/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    let sectionTitles = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "#"]
    var contactHeaderTitles : [String] = []
    var filteredContactHeader : [String] = []
    var filteredContacts : [Contacts] = []
    
//    var filteredData : [String : [Contacts]]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        searchBar.showsCancelButton = true
//        filteredData = contactDict
        
        contactHeaderTitles = contactDict.keys.sorted(by: { $0 < $1 })
        
        configureNavigation()
        registerCell()
        myTableView.dataSource = self
        myTableView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        contactHeaderTitles = contactDict.keys.sorted(by: { $0 < $1 })
        myTableView.reloadData()
    }
    
}




extension ViewController : UITableViewDataSource, UITableViewDelegate {

    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if searchBar.text?.isEmpty ?? true{
            return contactHeaderTitles.count
        } else {
            return filteredContactHeader.count
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchBar.text?.isEmpty ?? true{
            return contactDict[contactHeaderTitles[section]]!.count
        } else {
            return filteredContacts.count
        }
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ContactsTableViewCell = myTableView.dequeueReusableCell(withIdentifier: "ContactsTableViewCell") as! ContactsTableViewCell
        let contactsInCurrentSection = searchBar.text?.isEmpty ?? true ? contactDict[contactHeaderTitles[indexPath.section]]! : filteredContacts
        cell.showData(contact:contactsInCurrentSection[indexPath.row])
        return cell
        
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionTitles
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return searchBar.text?.isEmpty ?? true ? contactHeaderTitles[section] : filteredContactHeader[section]
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let contactDetailsVC : ContactDetailsViewController = storyboard.instantiateViewController(withIdentifier: "ContactDetailsViewController") as! ContactDetailsViewController
        if searchBar.text?.isEmpty ?? true {
            contactDetailsVC.contactToShow = contactDict[contactHeaderTitles[indexPath.section]]![indexPath.row]
        } else {
            contactDetailsVC.contactToShow = filteredContacts[indexPath.row]
        }
        
        navigationController?.pushViewController(contactDetailsVC, animated: true)
        
        
    }
    
}




extension ViewController {
    
    func configureNavigation() {
        self.title = "Contacts"
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addContactsVC))
        let groupsButton = UIBarButtonItem(title: "Groups", style: .plain, target: self, action: #selector(groupsVC))
        
        navigationItem.leftBarButtonItems = [groupsButton]
        navigationItem.rightBarButtonItems = [addButton]
        
    }
    
    @objc func addContactsVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addContactsVC : AddContactViewController = storyboard.instantiateViewController(withIdentifier: "AddContactViewController") as! AddContactViewController
        let navigationVC = UINavigationController(rootViewController: addContactsVC)
        addContactsVC.delegate = self
        present(navigationVC, animated: true)
        
//        let navigationVC = UINavigationController(rootViewController: addContactsVC)
//        present(navigationVC, animated: true)
        
    }
    
    @objc func groupsVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let groupsVC : GroupsViewController = storyboard.instantiateViewController(withIdentifier: "GroupsViewController") as! GroupsViewController
        let navigationVC = UINavigationController(rootViewController: groupsVC)
        present(navigationVC, animated: true)
        
    }
    
    func registerCell() {
        let nib = UINib(nibName: "ContactsTableViewCell", bundle: nil)
        myTableView.register(nib, forCellReuseIdentifier: "ContactsTableViewCell")
    }
}



extension ViewController : AddContactViewControllerProtocol {
    
    
    func updateData() {
        
        contactHeaderTitles = contactDict.keys.sorted(by: { $0 < $1 })
        self.myTableView.reloadData()
        
    }
}



extension ViewController : UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text?.isEmpty ?? true {
            filteredContactHeader = contactHeaderTitles
            myTableView.reloadData()
            return
        }
        filteredContacts = []
        let firstCharacter = String(searchBar.text!.first!)
        filteredContactHeader = contactHeaderTitles.filter({$0.lowercased() == firstCharacter.lowercased()})
        if !filteredContactHeader.isEmpty {
            let contacts = contactDict[firstCharacter] ?? []
            filteredContacts = contacts.filter({$0.firstName.lowercased().contains(searchBar.text?.lowercased() ?? "")})
        }
        myTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        filteredContactHeader = contactHeaderTitles
        myTableView.reloadData()
    }
    
    
    
}
