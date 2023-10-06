//
//  AddSpaceshipButtonView.swift
//  Observable-Test-Project
//
//  Created by Jacob M Sock  on 10/2/23.
//

import SwiftUI

struct AddRockButtonView: View {
    
    @Environment(RockListModel.self) private var rockListModel
    @State private var selectedRockType: RockType = .igneous
    @State var rockNameText : String = ""
    
    var body: some View {
        VStack{
            
            
            TextField("Enter New Rock Name", text: $rockNameText)
            
            // Create a Picker to select the color
            Picker("Rock Type ", selection: $selectedRockType) {
                ForEach(RockType.allCases, id: \.rawValue) { type in
                    Text(String(describing: type))
                        .tag(type)
                }
            }.pickerStyle(.wheel)
            
            Button(action: {
                print("pressed")
                
                if let currentlySelectedRock = rockListModel.rocks.first(where: { $0.isSelected }) {
                    currentlySelectedRock.isSelected = false
                }
                let rock = RockModel(rockName: rockNameText, isSelected: true, rockType: selectedRockType)
                print("Selected rock type:\(rock.rockType.rawValue)")
                rockListModel.rocks.append(rock)
                rockNameText = ""
                
            }, label: {
                Text("Submit")
            })
        }
    }
}

#Preview {
    AddRockButtonView().environment(RockListModel(rocks: [RockModel(rockName: "Granite", isSelected: true, rockType: .igneous)]))
}
