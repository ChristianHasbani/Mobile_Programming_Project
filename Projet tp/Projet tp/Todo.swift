//
//  Todo.swift
//  Projet tp
//
//  Created by Raif El Sayed on 07/11/2022.
//

import Foundation
//class modele d'une todo avec un nom, une description, une date et une category
class Todo
{
var nom : String
var description: String
var date: Date
var category: todoCategory
    
    init(nom: String,description:String,date: Date, cat: todoCategory)
    {
        self.nom = nom
        self.description = description
        self.date = date
        self.category = cat
        self.category.myData.append(self)
        }
}
