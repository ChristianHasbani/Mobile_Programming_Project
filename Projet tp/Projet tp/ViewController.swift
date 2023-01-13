//
//  ViewController.swift
//  Projet tp
//
//  Created by Raif El Sayed on 07/11/2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UISearchBarDelegate{ // Controller de la page des todo d'une category
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tabview1: UITableView!
    @IBOutlet weak var barreControle: UINavigationItem!
    var myData:[Todo]=[]
    var filteredData:[Todo] = []
    var dataCat: todoCategory?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        barreControle.title = dataCat?.nom //nom de la page = nom de la category
        myData = myData.sorted(by: { $0.date < $1.date}) // on trie les todo par ordre des dates
        filteredData = myData
        tabview1.dataSource = self
        searchBar.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    //Initialise la tableview
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! TableViewCell
        cell.mynom.text = filteredData[indexPath.row].nom
        cell.btnDelete.tag = indexPath.row
        return cell
        
    }
    
    //Permet d'envoyer les informations d'une tache sur sa page de details
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetailTacheController {
            let row = tabview1.indexPathForSelectedRow!.row
            vc.data = filteredData[row]
        }
    }
    
    //Permet de supprimer une todo
    @IBAction func deleteTODO(_ sender: UIButton) {
        let row = sender.tag
        myData.remove(at: row)
        tabview1.reloadData()
    }
    
        //Permet d'ajouter une nouvelle todo
        @IBAction func Save(_ unwindSegue: UIStoryboardSegue) {
            if let vc = unwindSegue.source as? AddController {
                
                myData.append(Todo(nom: vc.nomTacheAdd.text!, description: vc.nomDescriptionAdd.text!, date: vc.dateAdd.date, cat: dataCat ?? todoCategory(nom: "Aucune categorie")))
                myData = myData.sorted(by: { $0.date < $1.date})
                filteredData = myData
                tabview1.reloadData()
            }
            // Use data from the view controller which initiated the unwind segue
        }
 
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        for task in myData{
            if searchText.isEmpty{
                filteredData = myData
            }
            if task.nom.uppercased().contains(searchText.uppercased()){
                filteredData.append(task)
            }
        }
        tabview1.reloadData()
    }


}

