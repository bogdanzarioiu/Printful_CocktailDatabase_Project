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
    let strAlcoholic: String
    let strDrink: String
    let strDrinkThumb: String
    let strInstructions: String
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
}
