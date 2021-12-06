//
//  RecipeListView.swift
//  recipe list app
//
//  Created by Sunghee Bang on 2021-09-20.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    private var title: String {
        if model.selectedCategory == nil || model.selectedCategory == Constants.defaultListFilter {
            return "All Recipes"
        } else {
            return model.selectedCategory!
        }
    }
    
    var body: some View {
        
        NavigationView {
            
            VStack (alignment: .leading){
                
                Text(title)
                    .fontWeight(.bold)
                    .padding(.top, 40)
                    .font(Font.custom("Avenir Heavy", size: 24))
                
                ScrollView {
                    
                    LazyVStack (alignment: .leading){
                        ForEach (model.recipes) { r in
                            
                            if model.selectedCategory == nil ||
                                model.selectedCategory == Constants.defaultListFilter ||
                                model.selectedCategory != nil && r.category == model.selectedCategory {
                                NavigationLink(
                                    destination: RecipeDetailView(recipe: r),
                                    label: {
                                        
                                        // MARK: Row Item
                                        HStack(spacing: 20.0) {
                                            Image(r.image)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                .clipped()
                                                .cornerRadius(5)
                                            VStack (alignment: .leading){
                                                Text(r.name)
                                                    .foregroundColor(.black)
                                                    .font(Font.custom("Avenir Heavy", size: 16))
                                                RecipeHighlights(highlights: r.highlights)
                                                    .foregroundColor(.black)
                                            }
                                        }
                                    })
                            }
                        }
                    }
                }
            }
            .navigationBarHidden(true)
            .padding(.leading)
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
