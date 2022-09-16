//
//  GroupsViewController.swift
//  myContacts
//
//  Created by Nitesh Kumar Singh on 03/09/22.
//

import UIKit

class GroupsViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigation()
        registerCell()
        
        myTableView.dataSource = self
        myTableView.delegate = self
    }
    
}



extension GroupsViewController {
    
    func configureNavigation() {
        self.title = "Groups"
        
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(popGroupsVC))
        navigationItem.rightBarButtonItems = [doneButton]
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc func popGroupsVC(){
        navigationController?.popViewController(animated: true)
        self.dismiss(animated: true)
    }
    
    func registerCell() {
        let nib = UINib(nibName: "GroupsTableViewCell", bundle: nil)
        myTableView.register(nib, forCellReuseIdentifier: "GroupsTableViewCell")
    }
    
}


extension GroupsViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : GroupsTableViewCell = myTableView.dequeueReusableCell(withIdentifier: "GroupsTableViewCell") as! GroupsTableViewCell
        return cell
    }
    
    
    
    
}
