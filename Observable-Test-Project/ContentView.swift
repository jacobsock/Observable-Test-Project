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
            Text("Rock types:")
            RockCategoryView()
                .padding()
            
        }
        
    
    }
}

#Preview {
    ContentView()
        .environment(RockListModel(rocks: [RockModel(rockName: "Granite", isSelected: true, rockType: .igneous)]))
}
