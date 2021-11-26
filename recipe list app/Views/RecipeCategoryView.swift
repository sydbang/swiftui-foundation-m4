//
//  RecipeCategoryView.swift
//  recipe list app
//
//  Created by Sunghee Bang on 2021-11-24.
//

import SwiftUI

struct RecipeCategoryView: View {
    @EnvironmentObject var model: RecipeModel
    
    var body: some View {
        VStack (alignment: .leading){
            Text("Categories")
                .fontWeight(.bold)
                .padding(.top, 40)
                .font(Font.custom("Avenir Heavy", size: 24))
            
            LazyVGrid(columns: [GridItem(.flexible(), spacing: 20, alignment: .top), GridItem(.flexible(), spacing: 20, alignment: .top)], alignment: .center, spacing: 20) {
                ForEach (Array(model.categories), id: \.self) { category in
                    Text(category)
                }
            }
            
        }
    }
}

struct RecipeCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCategoryView()
    }
}
