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
        
        //  AddRockButtonView(rockNameText: $rockNameText, rockType: rockType)
        
        ForEach(rockListModel.rocks){ rock in
            
            if(rock.rockType.rawValue == rockType.rawValue){
                VStack{
                    NavigationLink(rock.rockName, value: rock)
                    
                } .navigationDestination(for: RockModel.self) { rock in
                    RockDetailView(rock: rock)
                }

                    .onLongPressGesture{
                        if let idx = rockListModel.rocks.firstIndex(where: { $0.id == rock.id }) {
                            rockListModel.rocks.remove(at: idx)
                        }
                    }
            }
        }
    }
}

#Preview {
    RockListView(rockType: .igneous).environment(RockListModel(rocks: [RockModel(rockName: "Granite", isSelected: true, rockType: .igneous)]))
}
