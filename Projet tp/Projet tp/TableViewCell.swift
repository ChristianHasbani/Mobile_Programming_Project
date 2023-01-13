//
//  TableViewCell.swift
//  Projet tp
//
//  Created by Raif El Sayed on 07/11/2022.
//

import UIKit

class TableViewCell: UITableViewCell { // Permet de gerer une cell d'une tableview

    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
