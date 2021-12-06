//
//  RecipeTabView.swift
//  recipe list app
//
//  Created by Sunghee Bang on 2021-09-23.
//

import SwiftUI

struct RecipeTabView: View {
    
    @State var selecteTab = Constants.featuredTab
    
    var body: some View {
        
        TabView (selection: $selecteTab){
            RecipeFeaturedView()
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }
                .tag(Constants.featuredTab)
            
            RecipeCategoryView(selectedTab: $selecteTab)
                .tabItem {
                    VStack {
                        Image(systemName: "square.grid.2x2")
                        Text("Category")
                    }
                }
                .tag(Constants.categoryTab)
            
            RecipeListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
                .tag(Constants.listTab)
        }
        .environmentObject(RecipeModel())
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
