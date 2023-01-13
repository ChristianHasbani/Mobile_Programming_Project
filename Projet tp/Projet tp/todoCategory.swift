//
//  todoCategory.swift
//  Projet tp
//
//  Created by Raif El Sayed on 07/11/2022.
//

import Foundation
//class modele d'une category
class todoCategory
{
var name : String
var tasks:[Todo]=[]

    init(nom: String)
    {
        self.name = nom
        
    }
}
