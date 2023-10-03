//
//  AddSpaceshipButtonView.swift
//  Observable-Test-Project
//
//  Created by Jacob M Sock  on 10/2/23.
//

import SwiftUI

struct AddRockButtonView: View {
    @Environment(RockListModel.self) private var rockListModel
    @Binding var rockNameText : String
    var rockType : RockType
    var body: some View {
        VStack{
            TextField("Enter Rock Name", text: $rockNameText)
            
            Button(action: {
                print("pressed")
                
                if let currentlySelectedRock = rockListModel.rocks.first(where: { $0.isSelected }) {
                    currentlySelectedRock.isSelected = false
                }
                let rock = RockModel(rockName: rockNameText, isSelected: true, rockType: rockType)
                rockListModel.rocks.append(rock)
                rockNameText = ""
                
            }, label: {
                Text("Submit")
            })
        }
    }
}

#Preview {
    AddRockButtonView(rockNameText: .constant(""), rockType: .igneous)
}
