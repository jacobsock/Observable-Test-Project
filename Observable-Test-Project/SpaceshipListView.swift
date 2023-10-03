//
//  SpaceshipListView.swift
//  Observable-Test-Project
//
//  Created by Jacob M Sock  on 10/2/23.
//

import SwiftUI

struct SpaceshipListView: View {
    @Environment(SpaceshipListModel.self) private var spaceshipListModel
    @State var spaceshipNameText = ""
    var spaceshipType : SpaceshipType
    var body: some View {
        
        AddSpaceshipButtonView(spaceshipNameText: $spaceshipNameText, spaceshipType: spaceshipType)
        
        List {
            ForEach(spaceshipListModel.spaceships){ spaceship in
                
                if(spaceship.spaceshipType.rawValue == spaceshipType.rawValue){
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
                    
                    NavigationLink(destination: SpaceshipDetailView(spaceship: spaceship)){
                        Button {
                            print("more details pressed")
                        } label: {
                            Text("More details")
                        }
                    }
                }
            }
        }
        }
    }
    
#Preview {
    SpaceshipListView(spaceshipType: .racing).environment(SpaceshipListModel(spaceships: [SpaceshipModel(timeTraveled: 5, totalTimeOfJourney: 10, timeReamaining: 0, spaceshipName: "Jacob's Ship", isSelected: true, spaceshipType: .racing)]))
}
