//
//  ViewController.swift
//  Projet tp
//
//  Created by Christian Hasbani on 07/11/2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UISearchBarDelegate{
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bar: UINavigationItem!
    var tasks:[Todo]=[]
    var filteredData:[Todo] = []
    var category: todoCategory?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bar.title = category?.name
        tasks = tasks.sorted(by: { $0.date < $1.date})
        filteredData = tasks
        tableView.dataSource = self
        searchBar.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! TableViewCell
        cell.nameLabel.text = filteredData[indexPath.row].name
        cell.deleteBtn.tag = indexPath.row
        return cell
        
    }
    
    //Send information for the details controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? taskDetailsController {
            let row = tableView.indexPathForSelectedRow!.row
            vc.data = filteredData[row]
        }
    }
    
    //Delete a todo task
    @IBAction func deleteTODO(_ sender: UIButton) {
        let row = sender.tag
        filteredData.remove(at: row)
        tasks = filteredData
        tableView.reloadData()
    }
    
        //save a new todo task to the list
        @IBAction func Save(_ unwindSegue: UIStoryboardSegue) {
            if let vc = unwindSegue.source as? AddController {
                
                tasks.append(Todo(name: vc.name.text!, description: vc.desc.text!, date: vc.date.date, cat: category ?? todoCategory(nom: "Aucune categorie")))
                tasks = tasks.sorted(by: { $0.date < $1.date})
                filteredData = tasks
                tableView.reloadData()
            }
        }
 
    // Search in the table view
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        for task in tasks{
            if searchText.isEmpty{
                filteredData = tasks
            }
            if task.name.uppercased().contains(searchText.uppercased()){
                filteredData.append(task)
            }
        }
        tableView.reloadData()
    }


}

