//
//  Stop.swift
//  ArchTouchRoutes
//
//  Created by Marcelo Oliveira on 5/28/15.
//  Copyright (c) 2015 Marcelo Oliveira. All rights reserved.
//

import Foundation

class Stop {
    
    var id: Int!
    var name: String!
    var route_id: Int!
    var sequence: Int!
    
    init(id: Int, name: String, route_id: Int, sequence: Int){
        self.id = id
        self.name = name
        self.route_id = route_id
        self.sequence = sequence
    }
    
    init(attrDictionary: NSDictionary) {
        self.id = attrDictionary["id"] as Int
        self.name = attrDictionary["name"] as String
        self.route_id = attrDictionary["route_id"] as Int
        self.sequence = attrDictionary["sequence"] as Int
    }
    
    
    
}
