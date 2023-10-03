//
//  AddSpaceshipButtonView.swift
//  Observable-Test-Project
//
//  Created by Jacob M Sock  on 10/2/23.
//

import SwiftUI

struct AddSpaceshipButtonView: View {
    @Environment(SpaceshipListModel.self) private var spaceshipListModel
    @Binding var spaceshipNameText : String
    var spaceshipType : SpaceshipType
    var body: some View {
        VStack{
            TextField("Enter Spaceship Name", text: $spaceshipNameText)
            
            Button(action: {
                print("pressed")
                
                if let currentlySelectedSpaceship = spaceshipListModel.spaceships.first(where: { $0.isSelected }) {
                    currentlySelectedSpaceship.isSelected = false
                }
                let spaceship = SpaceshipModel(timeTraveled: Int.random(in: 1..<10), totalTimeOfJourney: Int.random(in: 50..<100), timeReamaining: 0, spaceshipName: spaceshipNameText, isSelected: true, spaceshipType: spaceshipType)
                spaceshipListModel.spaceships.append(spaceship)
                spaceshipNameText = ""
                
            }, label: {
                Text("Submit")
            })
        }
    }
}

#Preview {
    AddSpaceshipButtonView(spaceshipNameText: .constant(""), spaceshipType: .racing)
}
