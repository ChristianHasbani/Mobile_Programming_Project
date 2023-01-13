//
//  ViewController.swift
//  Projet tp
//
//  Created by Christian Hasbani on 07/11/2022.
//

import UIKit



class taskDetailsController: UIViewController{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var barDetails: UINavigationItem!
    
    var data: Todo?

        override func viewDidLoad() {
            super.viewDidLoad()
            
            if let todo = data {
                nameLabel.text = todo.name
                descLabel.text = todo.description
                barDetails.title = todo.name
                
                // on convertit la date au bon format
                let dateFormater = DateFormatter()
                dateFormater.dateFormat = "dd / MM / yyyy"
                dateFormater.locale = Locale(identifier: "FR-fr")
                let dateFormat = dateFormater.string(from: todo.date)
                dateLabel.text = dateFormat
                
            } else {
                nameLabel.text = "Error"
                descLabel.text = "Error"
                barDetails.title = "Error"
            }

            
        }
   


}
