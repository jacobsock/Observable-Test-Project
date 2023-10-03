//
//  SpaceshipCategoryView.swift
//  Observable-Test-Project
//
//  Created by Jacob M Sock  on 10/2/23.
//

import SwiftUI

struct SpaceshipCategoryView: View {
    var body: some View {
        
        ForEach(SpaceshipType.allCases, id: \.rawValue) { spaceshipType in
            
            NavigationLink(destination: SpaceshipListView(spaceshipType: spaceshipType)){
                Text(spaceshipType.rawValue)
            }
             }
    }
}

#Preview {
    SpaceshipCategoryView()
}
