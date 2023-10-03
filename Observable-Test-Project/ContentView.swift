//
//  ContentView.swift
//  Observable-Test-Project
//
//  Created by Jacob M Sock  on 9/29/23.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(SpaceshipListModel.self) private var spaceshipListModel
    var body: some View {

        NavigationStack{
            Text("Spaceship types:")
            SpaceshipCategoryView()
                .padding()
            
        }
        
    
    }
}

#Preview {
    ContentView()
        .environment(SpaceshipListModel(spaceships: [SpaceshipModel(timeTraveled: 5, totalTimeOfJourney: 10, timeReamaining: 0, spaceshipName: "Jacob's Ship", isSelected: true, spaceshipType: .racing)]))
}
