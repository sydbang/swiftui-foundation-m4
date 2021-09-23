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
    
}
