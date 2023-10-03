//
//  Observable_Test_ProjectApp.swift
//  Observable-Test-Project
//
//  Created by Jacob M Sock  on 9/29/23.
//

import SwiftUI

@main


struct Observable_Test_ProjectApp: App {
    
    @State private var rockListModel = RockListModel(rocks: [RockModel(rockName: "Granite", isSelected: true, rockType: .igneous)])
    var body: some Scene {
        WindowGroup {
            ContentView().environment(rockListModel)
        }
    }
}
