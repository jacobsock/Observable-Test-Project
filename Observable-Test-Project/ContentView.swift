//
//  ContentView.swift
//  Observable-Test-Project
//
//  Created by Jacob M Sock  on 9/29/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var spaceshipNameText = ""
    var spaceshipList : SpaceshipList = SpaceshipList(spaceships: [SpaceshipModel(timeTraveled: 5, totalTimeOfJourney: 10, timeReamaining: 0, spaceshipName: "Jacob's Ship", isSelected: true)])
    
    
    var randomNumber = Int.random(in: 0..<100)
    var body: some View {
        
        ForEach(spaceshipList.spaceships){spaceship in
            
            if(spaceship.isSelected){
                VStack {
                    
                    Text("\(spaceship.spaceshipName)")
                    Image(systemName: "globe.americas")
                    
                    Text("Time Traveled: \(spaceship.timeTraveled) years")
                    Text("Total Time of Journey: \(spaceship.totalTimeOfJourney) years")
                    
                    Text("Time Remaining: \(spaceship.timeRemaining) years")
                    Text("Random Number: \(randomNumber)")
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
                
                if let currentlySelectedSpaceship = spaceshipList.spaceships.first(where: { $0.isSelected }) {
                    currentlySelectedSpaceship.isSelected = false
                }
                let spaceship = SpaceshipModel(timeTraveled: Int.random(in: 1..<10), totalTimeOfJourney: Int.random(in: 50..<100), timeReamaining: 0, spaceshipName: spaceshipNameText, isSelected: true)
                spaceshipList.spaceships.append(spaceship)
                spaceshipNameText = ""
                
            }, label: {
                Text("Submit")
            })
        }
        
        
        List {
            ForEach(spaceshipList.spaceships){ spaceship in
                VStack{
                    Text("\(spaceship.spaceshipName)")
                    Text("Total Time Of Journey: \(spaceship.totalTimeOfJourney) Years")
                    Text("Total Time Travled: \(spaceship.timeTraveled) Years")
                    Text("Time Remaining: \(spaceship.timeRemaining) Years")
                }.background(spaceship.isSelected ? .cyan : .clear)
                    .onTapGesture {
                        if let currentlySelectedSpaceship = spaceshipList.spaceships.first(where: { $0.isSelected }) {
                            currentlySelectedSpaceship.isSelected = false
                        }
                        spaceship.isSelected = true
                    }
                    .onLongPressGesture{
                        if let idx = spaceshipList.spaceships.firstIndex(where: { $0.id == spaceship.id }) {
                            spaceshipList.spaceships.remove(at: idx)
                        }
                    }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
