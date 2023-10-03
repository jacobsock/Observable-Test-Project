//
//  UpdatedAnimalModel.swift
//  Observable-Test-Project
//
//  Created by Jacob M Sock  on 9/29/23.
//

import Foundation
import SwiftUI


enum RockType:  String,CaseIterable {

    case sedimentary, igneous, metamorphic
}


@Observable class RockModel : Identifiable {
    var id = UUID()
    var rockName : String
    var isSelected : Bool
    var rockType : RockType

    
    init(id: UUID = UUID(), rockName: String, isSelected: Bool, rockType: RockType) {
        self.id = id
        self.rockName = rockName
        self.isSelected = isSelected
        self.rockType = rockType
    }
}



@Observable class RockListModel {
    
    var rocks : [RockModel]
    
    init(rocks: [RockModel]) {
        self.rocks = rocks
    }
}
