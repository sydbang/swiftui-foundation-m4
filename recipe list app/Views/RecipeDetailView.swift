//
//  RecipeDetailView.swift
//  recipe list app
//
//  Created by Sunghee Bang on 2021-09-20.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    @State var selectedServingSize = 2
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading){
                
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Recipe Title
                Text(recipe.name)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                    .padding(.leading)
                    .font(.largeTitle)
                
                
                // MARK: Serving size picker
                VStack (alignment: .leading){
                    Text("Select your serving size:")
                    Picker("", selection: $selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 160)
                }
                .padding()
                
                // MARK: Ingredients
                VStack (alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.horizontal, 5)
                    
                    ForEach (recipe.ingredients) { item in
                        Text("• " + RecipeModel.getPortion(Ingredient: item, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + item.name.lowercased())
                    }
                }
                .padding([.leading, .trailing], 10)
                
                // MARK: Divider
                Divider()
                    
                // MARK: Directions
                VStack (alignment: .leading){
                    Text("Directions")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                    ForEach (0..<recipe.directions.count, id:\.self) { index in
                        Text(String(index+1) + ", " + recipe.directions[index])
                            .padding(.bottom, 5)
                        
                        
                    }
                }
                .padding(.horizontal, 10)
            }
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Create a dummy recipe and pass it into the detail view so that we can see a preview
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
