//
//  ViewControllerCategory.swift
//  Projet tp
//
//  Created by Raif El Sayed on 29/12/2022.
//

import UIKit

class ViewControllerCategory: UIViewController,UITableViewDataSource { //Controller des category

    @IBOutlet weak var tableViewCell: UITableView!
    
    var myDataCategory:[todoCategory]=[]

    override func viewDidLoad() {
        super.viewDidLoad()
        myDataCategory.append(todoCategory(nom: "business")) // creation de la categorie business
        myDataCategory.append(todoCategory(nom: "home")) // creation de la categorie home

        
        // Do any additional setup after loading the view.
        tableViewCell.dataSource = self

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myDataCategory.count
    }
    
    // Initialise la tableview
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! TableViewCell
        cell.nameLabel.text = myDataCategory[indexPath.row].name
        cell.deleteBtn.tag = indexPath.row
        return cell
    }
    
    //Permet de supprimer une category
    @IBAction func deleteTodoCat(_ sender: UIButton) {
        let row = sender.tag
        myDataCategory.remove(at: row)
        tableViewCell.reloadData()
    }
    
    //permet d'ajouter une category
    @IBAction func Save(_ unwindSegue: UIStoryboardSegue) {
        if let vc = unwindSegue.source as? addCategoryController {
            
            myDataCategory.append(todoCategory(nom: vc.categoryName.text!))

            tableViewCell.reloadData()
        }
        // Use data from the view controller which initiated the unwind segue
    }
    
    //Permet d'envoyer la categorie pour afficher ses todo
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ViewController {
            let row = tableViewCell.indexPathForSelectedRow!.row
            vc.category = myDataCategory[row]
            vc.filteredData = myDataCategory[row].tasks
        }
    }
    

}
