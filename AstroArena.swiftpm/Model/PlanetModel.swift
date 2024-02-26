//
//  PlanetModel.swift
//  AstroArena
//
//  Created by Alessandro Ricci on 18/02/24.
//

import Foundation
import SceneKit

struct Planet : Identifiable {
    
    var id: UUID = UUID()
    var planetCard: String
    var planetName: String
    var fileName: String
    var planetDetails: String

    
}
