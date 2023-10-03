//
//  ContentView.swift
//  Observable-Test-Project
//
//  Created by Jacob M Sock  on 9/29/23.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(RockListModel.self) private var rockListModel
    var body: some View {
        
        NavigationStack{
            
            RockCategoryView()
            
            
                .toolbar {
                    NavigationLink(destination: AddRockButtonView()){
                        Image(systemName: "plus")
                    }
                    
                }
                .padding()
            
        }
        
        
    }
}

#Preview {
    ContentView().environment(RockListModel(
        
        rocks: [RockModel(rockName: "Granite", isSelected: true, rockType: .igneous),
                
                RockModel(rockName: "Limestone", isSelected: false, rockType: .sedimentary),
                
                RockModel(rockName: "Slate", isSelected: false, rockType: .metamorphic),
               ]))
}
