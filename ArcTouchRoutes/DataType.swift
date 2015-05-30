//
//  DataType.swift
//  ArchTouchRoutes
//
//  Created by Marcelo Oliveira on 5/28/15.
//  Copyright (c) 2015 Marcelo Oliveira. All rights reserved.
//  Explanation: Define the type of Data, can be a Route, a Stop or a TimeTable

import Foundation

enum DataType: Int {
    case Route = 1
    case Stop = 2
    case TimeTable = 3
    
    init?(responseArray: NSArray){
        self = .Route
        
        var firstValue = (responseArray[0] as NSDictionary)
        
        if firstValue["longName"] != nil {
            self = .Route
        } else if firstValue["sequence"] != nil {
            self = .Stop
        } else if firstValue["calendar"] != nil {
            self = .TimeTable
        }
    }
    
}
