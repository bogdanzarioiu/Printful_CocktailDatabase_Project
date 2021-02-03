//
//  CocktailModel.swift
//  Printful_CocktailDatabase_Project
//
//  Created by Bogdan on 2/3/21.
//

import Foundation


struct Cocktails: Decodable {
    var drinks: [Cocktail]
}

struct Cocktail: Decodable {
    let type: String
    let name: String
    let cocktailImageURL: String
    let instructions: String
    let ingredient1: String?
    let ingredient2: String?
    let ingredient3: String?
    let ingredient4: String?
    let ingredient5: String?
    
    enum CodingKeys: String, CodingKey {
        case type = "strAlcoholic"
        case name = "strDrink"
        case cocktailImageURL = "strDrinkThumb"
        case instructions = "strInstructions"
        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
        
    }
}
