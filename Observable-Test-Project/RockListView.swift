//
//  SpaceshipListView.swift
//  Observable-Test-Project
//
//  Created by Jacob M Sock  on 10/2/23.
//

import SwiftUI

struct RockListView: View {
    @Environment(RockListModel.self) private var rockListModel
    @State var rockNameText = ""
    var rockType : RockType
    var body: some View {
        
        AddRockButtonView(rockNameText: $rockNameText, rockType: rockType)
        
        List {
            ForEach(rockListModel.rocks){ rock in
                
                if(rock.rockType.rawValue == rockType.rawValue){
                    VStack{
                        Text("\(rock.rockName)")
                        
                    }.background(rock.isSelected ? .cyan : .clear)
                        .onTapGesture {
                            if let currentlySelectedRock = rockListModel.rocks.first(where: { $0.isSelected }) {
                                currentlySelectedRock.isSelected = false
                            }
                            rock.isSelected = true
                        }
                        .onLongPressGesture{
                            if let idx = rockListModel.rocks.firstIndex(where: { $0.id == rock.id }) {
                                rockListModel.rocks.remove(at: idx)
                            }
                        }
                    
                    NavigationLink(destination: RockDetailView(rock: rock)){
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
    RockListView(rockType: .igneous).environment(RockListModel(rocks: [RockModel(rockName: "Granite", isSelected: true, rockType: .igneous)]))
}
