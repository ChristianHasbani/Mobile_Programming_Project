//
//  ViewController.swift
//  Projet tp
//
//  Created by Raif El Sayed on 07/11/2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UISearchBarDelegate{ // Controller de la page des todo d'une category
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bar: UINavigationItem!
    var tasks:[Todo]=[]
    var filteredData:[Todo] = []
    var category: todoCategory?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bar.title = category?.name //nom de la page = nom de la category
        tasks = tasks.sorted(by: { $0.date < $1.date}) // on trie les todo par ordre des dates
        filteredData = tasks
        tableView.dataSource = self
        searchBar.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    //Initialise la tableview
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! TableViewCell
        cell.nameLabel.text = filteredData[indexPath.row].name
        cell.deleteBtn.tag = indexPath.row
        return cell
        
    }
    
    //Permet d'envoyer les informations d'une tache sur sa page de details
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetailTacheController {
            let row = tableView.indexPathForSelectedRow!.row
            vc.data = filteredData[row]
        }
    }
    
    //Permet de supprimer une todo
    @IBAction func deleteTODO(_ sender: UIButton) {
        let row = sender.tag
        filteredData.remove(at: row)
        tasks = filteredData
        tableView.reloadData()
    }
    
        //Permet d'ajouter une nouvelle todo
        @IBAction func Save(_ unwindSegue: UIStoryboardSegue) {
            if let vc = unwindSegue.source as? AddController {
                
                tasks.append(Todo(name: vc.name.text!, description: vc.desc.text!, date: vc.date.date, cat: category ?? todoCategory(nom: "Aucune categorie")))
                tasks = tasks.sorted(by: { $0.date < $1.date})
                filteredData = tasks
                tableView.reloadData()
            }
            // Use data from the view controller which initiated the unwind segue
        }
 
    
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

