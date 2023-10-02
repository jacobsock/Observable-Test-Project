//
//  ContentView.swift
//  Observable-Test-Project
//
//  Created by Jacob M Sock  on 9/29/23.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(SpaceshipListModel.self) private var spaceshipListModel
    @State var spaceshipNameText = ""
    
    var body: some View {
        
        ForEach(spaceshipListModel.spaceships){spaceship in
            if(spaceship.isSelected){
                VStack {
                    
                    Text("\(spaceship.spaceshipName)")
                    Image(systemName: "globe.americas")
                    
                    Text("Time Traveled: \(spaceship.timeTraveled) years")
                    Text("Total Time of Journey: \(spaceship.totalTimeOfJourney) years")
                    
                    Text("Time Remaining: \(spaceship.timeRemaining) years")
                    Button(action: {
                        
                        spaceship.timeTraveled += 1
                        
                    }, label: {
                        Text("Increase Time Traveled")
                    })
                }
                
            }
            
        }
        
        VStack{
            TextField("Enter Spaceship Name", text: $spaceshipNameText)
            
            Button(action: {
                print("pressed")
                
                if let currentlySelectedSpaceship = spaceshipListModel.spaceships.first(where: { $0.isSelected }) {
                    currentlySelectedSpaceship.isSelected = false
                }
                let spaceship = SpaceshipModel(timeTraveled: Int.random(in: 1..<10), totalTimeOfJourney: Int.random(in: 50..<100), timeReamaining: 0, spaceshipName: spaceshipNameText, isSelected: true)
                spaceshipListModel.spaceships.append(spaceship)
                spaceshipNameText = ""
                
            }, label: {
                Text("Submit")
            })
        }
        SpaceshipListView()
        .padding()
    }
}

#Preview {
    ContentView()
        .environment(SpaceshipListModel(spaceships: [SpaceshipModel(timeTraveled: 5, totalTimeOfJourney: 10, timeReamaining: 0, spaceshipName: "Jacob's Ship", isSelected: true)]))
}
