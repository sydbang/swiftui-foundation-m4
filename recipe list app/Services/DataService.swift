//
//  DataService.swift
//  recipe list app
//
//  Created by Sunghee Bang on 2021-09-20.
//

import Foundation

class DataService {
    static func getLocalData() -> [Recipe] {
        
        // Parse local json file
        
        // Get a url path to the jason file
        
        // Create a url object
        
        // Create a data object
        
        // Decode the data with a JSON decoder
        
        // Add the unique IDs
        
        // Return the recipes
        
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        //Guard statemnet
        //Check if pathString is not nil, otherwise ... return
        guard pathString != nil else {
            return [Recipe]()
        }
        
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            let data = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                for r in recipeData {
                    r.id = UUID()
                    
                    //add unique ID to recipe ingredients
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                }
                
                return recipeData
            }
            catch {
                print(error)
            }
            
        }
        catch {
            // error with getting data
            print(error)
        }
        
        return [Recipe]() // for errors
    }
}
