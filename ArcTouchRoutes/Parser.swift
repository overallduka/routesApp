//
//  Parser.swift
//  ArchTouchRoutes
//
//  Created by Marcelo Oliveira on 5/28/15.
//  Copyright (c) 2015 Marcelo Oliveira. All rights reserved.
//  Explanation: Transform the data of httpRequest in a collection of one type - dataType(Routes, Stop or Timetable)

import Foundation

class Parser {
    
    var collection: [AnyObject]
    
    private var responseArray = []
    
    init(responseArray: NSArray, dataType: DataType){
        collection = []
        
        self.responseArray = responseArray
        
        switch dataType {
        case .Route:
            parseRoutes()
        case .Stop:
            parseStops()
        case .TimeTable:
            parseTimeTable()
        }
    }
    
    
    private func parseTimeTable(){
        for timeTable in self.responseArray {
            var newTimeTable = TimeTable(attrDictionary: timeTable as NSDictionary)
            self.collection.append(newTimeTable)
        }
    }
    
    private func parseRoutes() {
        for route in self.responseArray {
            var newRoute = Route(attrDictionary: route as NSDictionary)
            self.collection.append(newRoute)
        }
    }
    
    private func parseStops() {
        for stop in self.responseArray {
            var newStop = Stop(attrDictionary: stop as NSDictionary)
            self.collection.append(newStop)
        }
    }
    
}
