//
//  SpaceshipListView.swift
//  Observable-Test-Project
//
//  Created by Jacob M Sock  on 10/2/23.
//

import SwiftUI

struct SpaceshipListView: View {
    @Environment(SpaceshipListModel.self) private var spaceshipListModel
    var body: some View {
        List {
            ForEach(spaceshipListModel.spaceships){ spaceship in
                VStack{
                    Text("\(spaceship.spaceshipName)")
                    Text("Total Time Of Journey: \(spaceship.totalTimeOfJourney) Years")
                    Text("Total Time Travled: \(spaceship.timeTraveled) Years")
                    Text("Time Remaining: \(spaceship.timeRemaining) Years")
                }.background(spaceship.isSelected ? .cyan : .clear)
                    .onTapGesture {
                        if let currentlySelectedSpaceship = spaceshipListModel.spaceships.first(where: { $0.isSelected }) {
                            currentlySelectedSpaceship.isSelected = false
                        }
                        spaceship.isSelected = true
                    }
                    .onLongPressGesture{
                        if let idx = spaceshipListModel.spaceships.firstIndex(where: { $0.id == spaceship.id }) {
                            spaceshipListModel.spaceships.remove(at: idx)
                        }
                    }
            }
        }
    }
}

#Preview {
    SpaceshipListView().environment(SpaceshipListModel(spaceships: [SpaceshipModel(timeTraveled: 5, totalTimeOfJourney: 10, timeReamaining: 0, spaceshipName: "Jacob's Ship", isSelected: true)]))
}
