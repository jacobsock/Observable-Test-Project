//
//  UpdatedAnimalModel.swift
//  Observable-Test-Project
//
//  Created by Jacob M Sock  on 9/29/23.
//

import Foundation
import SwiftUI


@Observable class SpaceshipModel : Identifiable {
    var id = UUID()
    var timeTraveled : Int
    var totalTimeOfJourney : Int
    var spaceshipName : String
    var isSelected : Bool
    
    var timeRemaining : Int{
        return totalTimeOfJourney - timeTraveled
    }
    
    var randomNumber : Int {
        
        return Int.random(in: 0..<100)
    }
    
    
    init(timeTraveled: Int, totalTimeOfJourney: Int, timeReamaining: Int, spaceshipName: String, isSelected: Bool) {
        self.timeTraveled = timeTraveled
        
        self.totalTimeOfJourney = totalTimeOfJourney
        
        self.spaceshipName = spaceshipName
        
        self.isSelected = isSelected

    }
}



@Observable class SpaceshipListModel {
    
    var spaceships : [SpaceshipModel]
    
    init(spaceships: [SpaceshipModel]) {
        self.spaceships = spaceships
    }
}
