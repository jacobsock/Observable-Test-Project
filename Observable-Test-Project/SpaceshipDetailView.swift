//
//  SpaceshipDetailView.swift
//  Observable-Test-Project
//
//  Created by Jacob M Sock  on 10/2/23.
//

import SwiftUI

struct SpaceshipDetailView: View {
    
    var spaceship : SpaceshipModel
    var body: some View {
        Text("\(spaceship.spaceshipName) : Detail View")
    }
}

#Preview {
    SpaceshipDetailView(spaceship: SpaceshipModel(timeTraveled: 5, totalTimeOfJourney: 10, timeReamaining: 0, spaceshipName: "Jacob's Ship", isSelected: true, spaceshipType: .racing))
}
