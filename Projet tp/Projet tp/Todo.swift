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
var name : String
var description: String
var date: Date
var category: todoCategory
    
    init(name: String,description:String,date: Date, cat: todoCategory)
    {
        self.name = name
        self.description = description
        self.date = date
        self.category = cat
        self.category.tasks.append(self)
        }
}
