//
//  SpaceshipCategoryView.swift
//  Observable-Test-Project
//
//  Created by Jacob M Sock  on 10/2/23.
//

import SwiftUI

struct RockCategoryView: View {
    @Environment(RockListModel.self) private var rockListModel
    var body: some View {
        

        //Creates sections based on all RockTypes
        List(RockType.allCases, id: \.rawValue) { rockType in
                Section(rockType.rawValue){
                    //Within each Rock Type Section we display each rock
                 RockListView(rockType: rockType)
                }
        }
    }
}

#Preview {
    
    RockCategoryView().environment(RockListModel(
        
        rocks: [RockModel(rockName: "Granite", isSelected: true, rockType: .igneous),
                                                         
                RockModel(rockName: "Limestone", isSelected: true, rockType: .sedimentary),
                
                RockModel(rockName: "Slate", isSelected: true, rockType: .metamorphic),
                                                        
                                                        
                                        ]))
}
