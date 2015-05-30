//
//  TimeTable.swift
//  ArchTouchRoutes
//
//  Created by Marcelo Oliveira on 5/28/15.
//  Copyright (c) 2015 Marcelo Oliveira. All rights reserved.
//

import Foundation

class TimeTable {
    
    var id: Int!
    var calendar: String!
    var time: String!
    
    init(attrDictionary: NSDictionary) {
        self.id = attrDictionary["id"] as Int!
        self.calendar = attrDictionary["calendar"] as String!
        self.time = attrDictionary["time"] as String!
    }
    
}
