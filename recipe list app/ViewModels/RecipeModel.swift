//
//  RecipeModel.swift
//  recipe list app
//
//  Created by Sunghee Bang on 2021-09-20.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        //Create an instance of data service and get the data
        
        //Set the recipe property
        
        /*
        let service = DataService()
        self.recipes = service.getLocalData()
        */
        
        //self.recipes = DataService().getLocalData()
        
        //Make function getLocalData from the data service a "static" function and we can just do this without creating instance of dataservice
        self.recipes = DataService.getLocalData()
    }
    
    static func getPortion(Ingredient:Ingredient, recipeServings:Int, targetServings:Int) -> String {
        
        var portion = ""
        var numerator = Ingredient.num ?? 1
        var denominator = Ingredient.denum ?? 1
        var wholePortion = 0
        
        
        if Ingredient.num != nil {
            
            // Get a single serving size by multiplying denominator by the recipe servings
            denominator *= recipeServings
            
            // Get target portion by multiplying numerator by target servings
            numerator *= targetServings
            
            // Reduce fraction by greatest common divisor
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            // Get the whole portion if numerator > denominator
            if numerator >= denominator {
                
                // Calculated the whole portions
                wholePortion = numerator / denominator
                
                // Calculated the remainder
                numerator %= denominator
                
                // Assign to portion string
                portion += String (wholePortion)
                
            }
            // Express the remainder as a fraction
            if numerator > 0 {
                
                // Assign remainder as fraction to the portion string
                portion += wholePortion > 0 ? "" : ""
                portion += "\(numerator)/\(denominator)"
            }
        }
        if var unit = Ingredient.unit {
            
            // Calculate appropriate suffix
            if wholePortion > 1 {
                
                if unit.suffix(2) == "ch" {
                    unit += "es"
                }
                else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                }
                else {
                    unit += "s"
                }
            }
            
            
            portion += Ingredient.num == nil && Ingredient.denum == nil ? "": " "
            return portion + unit
            
        }
        
        
        
        
        return portion
    }
}
