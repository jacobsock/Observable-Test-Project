//
//  SpaceshipDetailView.swift
//  Observable-Test-Project
//
//  Created by Jacob M Sock  on 10/2/23.
//

import SwiftUI

struct RockDetailView: View {
    
    var rock : RockModel
    var body: some View {
        Text("\(rock.rockName)")
        Text("\(rock.rockType.rawValue)")
    }
}

#Preview {
    RockDetailView(rock: RockModel(rockName: "Granite", isSelected: true, rockType: .igneous))
}
