//
//  SortedListsVC.swift
//  LuluLemon
//
//  Created by River Camacho on 10/18/21.
//

import UIKit

class SortedListsVC: UIViewController {
    @IBOutlet weak var sortControl: UISegmentedControl!
    @IBOutlet weak var tblView: UITableView!
    let sortVM = SortedListsVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "List"
        tblView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadTable()
    }
    @IBAction func goToAddItems(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addItemVC = storyboard.instantiateViewController(withIdentifier: "AddItemVC") as! AddItemVC
        addItemVC.completionHandler = {
            self.reloadTable()
        }
        self.present(addItemVC, animated: true)
    }
    @IBAction func sortedControl(_ sender: Any) {
        reloadTable()
    }
    func reloadTable() {
    sortVM.fetchDataFromDb(sortIndex: sortControl.selectedSegmentIndex)
    DispatchQueue.main.async {
        self.tblView.reloadData()
    }
  }
}
extension SortedListsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortVM.getItemCount()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = sortVM.getItemName(index: indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") { action, view, completionHandler in
            self.sortVM.deleteItemFromDB(index: indexPath.row)
            self.reloadTable()
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
}
