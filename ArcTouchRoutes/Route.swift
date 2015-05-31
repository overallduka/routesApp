//
//  Route.swift
//  ArchTouchRoutes
//
//  Created by Marcelo Oliveira on 5/27/15.
//  Copyright (c) 2015 Marcelo Oliveira. All rights reserved.
//

import Foundation


class Route {
    var agencyId: Int!
    var id: Int!
    var lastModifiedDate: String!
    var longName: String!
    var shortName: String!
    
    
    init(agencyId: Int, id: Int, lastModifiedDate: String, longName: String, shortName: String){
        self.agencyId = agencyId
        self.id = id
        self.lastModifiedDate = lastModifiedDate
        self.longName = longName
        self.shortName = shortName
    }
    
    init(attrDictionary: NSDictionary){
        self.agencyId = attrDictionary["agencyId"] as Int!
        self.id = attrDictionary["id"] as Int!
        self.lastModifiedDate = attrDictionary["lastModifiedDate"] as String!
        self.longName = attrDictionary["longName"] as String!
        self.shortName = attrDictionary["shortName"] as String!
    }
    
    
}
