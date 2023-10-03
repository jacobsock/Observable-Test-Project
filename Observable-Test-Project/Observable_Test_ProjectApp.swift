//
//  Observable_Test_ProjectApp.swift
//  Observable-Test-Project
//
//  Created by Jacob M Sock  on 9/29/23.
//

import SwiftUI

@main


struct Observable_Test_ProjectApp: App {
    
    @State private var spaceshipListModel = SpaceshipListModel(spaceships: [SpaceshipModel(timeTraveled: 5, totalTimeOfJourney: 10, timeReamaining: 0, spaceshipName: "Jacob's Ship", isSelected: true, spaceshipType: .racing)])
    var body: some Scene {
        WindowGroup {
            ContentView().environment(spaceshipListModel)
        }
    }
}
