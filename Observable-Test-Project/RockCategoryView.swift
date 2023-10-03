//
//  SpaceshipCategoryView.swift
//  Observable-Test-Project
//
//  Created by Jacob M Sock  on 10/2/23.
//

import SwiftUI

struct RockCategoryView: View {
    var body: some View {
        
        ForEach(RockType.allCases, id: \.rawValue) { rockType in
            
            NavigationLink(destination: RockListView(rockType: rockType)){
                
                Section(rockType.rawValue){
                    
                }
            }
        }
    }
}

#Preview {
    RockCategoryView()
}
