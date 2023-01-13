//
//  ViewController.swift
//  Projet tp
//
//  Created by Christian Hasbani on 07/11/2022.
//

import UIKit

class ViewControllerCategory: UIViewController,UITableViewDataSource { //Controller des category

    @IBOutlet weak var tableViewCell: UITableView!
    
    var myDataCategory:[todoCategory]=[]

    override func viewDidLoad() {
        super.viewDidLoad()
        myDataCategory.append(todoCategory(nom: "Work"))
        myDataCategory.append(todoCategory(nom: "Travel"))

        
        tableViewCell.dataSource = self

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myDataCategory.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! TableViewCell
        cell.nameLabel.text = myDataCategory[indexPath.row].name
        cell.deleteBtn.tag = indexPath.row
        return cell
    }
    
    //Delete a category from the tableview
    @IBAction func deleteTodoCat(_ sender: UIButton) {
        let row = sender.tag
        myDataCategory.remove(at: row)
        tableViewCell.reloadData()
    }
    
    //add a category to the tableview
    @IBAction func Save(_ unwindSegue: UIStoryboardSegue) {
        if let vc = unwindSegue.source as? addCategoryController {
            
            myDataCategory.append(todoCategory(nom: vc.categoryName.text!))

            tableViewCell.reloadData()
        }
    }
    
    //Send all the tasks for that category
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ViewController {
            let row = tableViewCell.indexPathForSelectedRow!.row
            vc.category = myDataCategory[row]
            vc.filteredData = myDataCategory[row].tasks
        }
    }
    

}
