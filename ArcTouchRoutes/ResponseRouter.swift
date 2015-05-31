//
//  ResponseRouter.swift
//  ArchTouchRoutes
//
//  Created by Marcelo Oliveira on 5/28/15.
//  Copyright (c) 2015 Marcelo Oliveira. All rights reserved.
//  Explanation: Send the result to the httpRequest to some controller

import Foundation

class ResponseRouter {
    
    private var responseCollection: NSArray!
    private let dataType: DataType
    
    init(requestResponse: NSDictionary){
        self.responseCollection = []
        self.dataType = DataType.Route
        
        var responseArray  = requestResponse["rows"] as NSArray
        
        if responseArray.count <= 0 {
            emptyData()
        } else {
            
            self.dataType = DataType(responseArray: responseArray)!
            
            var parser = Parser(responseArray: responseArray, dataType: dataType)
            
            self.responseCollection = parser.collection
            
            launchNotification()
        }
    }
    
    func emptyData(){
        var alert : UIAlertView = UIAlertView()
        alert.addButtonWithTitle("OK")
        alert.title = "Warning"
        alert.message = "No results for your search, try again"
        alert.show()
    }
    
    
    func launchNotification(){
        
        switch self.dataType {
        case .Route:
            updateTableRoutesNotification()
        case .Stop:
            updateStopCollectionNotification()
        case .TimeTable:
            updateTimeTableCollectionNotification()
        }
        
    }
    
    func updateTableRoutesNotification(){
        NSNotificationCenter.defaultCenter()
            .postNotificationName("updateTableRoutesNotification", object: self, userInfo: ["routesCollection": self.responseCollection])
    }
    
    func updateStopCollectionNotification(){
        NSNotificationCenter.defaultCenter()
            .postNotificationName("updateStopCollectionNotification", object: self, userInfo: ["stopsCollection": self.responseCollection])
    }
    
    func updateTimeTableCollectionNotification(){
        NSNotificationCenter.defaultCenter()
            .postNotificationName("updateTimeTableCollectionNotification", object: self, userInfo: ["timeTablesCollection": self.responseCollection])
    }
    
}
