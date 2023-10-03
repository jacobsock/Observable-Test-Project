//
//  UpdatedAnimalModel.swift
//  Observable-Test-Project
//
//  Created by Jacob M Sock  on 9/29/23.
//

import Foundation
import SwiftUI


enum RockType:  String, CaseIterable, Hashable {

    case sedimentary, igneous, metamorphic
}

@Observable class RockModel : Hashable, Identifiable {
    
    var id = UUID()
    var rockName : String
    var isSelected : Bool
    var rockType : RockType

    static func == (lhs: RockModel, rhs: RockModel) -> Bool {
            return lhs.id == rhs.id && lhs.rockName == rhs.rockName && lhs.isSelected == rhs.isSelected && lhs.rockType == rhs.rockType
        }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(rockName)
        hasher.combine(isSelected)
        hasher.combine(rockType)
    }
    
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
