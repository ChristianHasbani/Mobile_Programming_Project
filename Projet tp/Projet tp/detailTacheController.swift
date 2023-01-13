//
//  detailTacheController.swift
//  Projet tp
//
//  Created by Raif El Sayed on 07/11/2022.
//

import UIKit

//class permettant de gerer l'affichage du detail d'une todo
class DetailTacheController: UIViewController{
    @IBOutlet weak var tache: UILabel!
    @IBOutlet weak var myDescription: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var barreCobtrole: UINavigationItem!
    
    var data: Todo?

        override func viewDidLoad() {
            super.viewDidLoad()
            
            if let todo = data { //si on a recuperer une todo
                tache.text = todo.nom // on affiche son nom
                myDescription.text = todo.description // on affiche sa description
                barreCobtrole.title = todo.nom // on change le titre de la page avec son nom
                
                // on convertit la date au bon format
                let dateFormater = DateFormatter()
                dateFormater.dateFormat = "dd / MM / yyyy"
                dateFormater.locale = Locale(identifier: "FR-fr")
                let dateFormat = dateFormater.string(from: todo.date)
                dateLabel.text = dateFormat // on affiche la date
                
            } else { // sinon on adffche une erreur
                tache.text = "Erreur"
                myDescription.text = "Erreur"
                barreCobtrole.title = "Erreur"
            }

            // Do any additional setup after loading the view.
        }
   


}
