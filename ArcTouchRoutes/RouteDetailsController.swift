//
//  RouteDetailsController.swift
//  ArchTouchRoutes
//
//  Created by Marcelo Oliveira on 5/28/15.
//  Copyright (c) 2015 Marcelo Oliveira. All rights reserved.
//

import UIKit

class RouteDetailsController: UIViewController {
    
    @IBOutlet weak var routeNameLabel: UILabel!
    
    var currentRoute: Route!
    
    var stopsCollection: [Stop]!
    var timeTableCollection: [TimeTable]!
    
    
    @IBOutlet weak var stopsTable: StopTableView!
    @IBOutlet weak var timetablesTable: TimetableTableView!
    
    override func viewDidLoad() {
        stopsCollection = []
        timeTableCollection = []
        
        routeNameLabel.text = currentRoute.longName
        
        RoutesAPI.sharedInstance.findStopsByRouteId(currentRoute.id)
        RoutesAPI.sharedInstance.findDeparturesByRouteId(currentRoute.id)
        
        NSNotificationCenter.defaultCenter()
            .addObserver(self, selector:"updateStopsCollection:", name: "updateStopCollectionNotification", object: nil)
        
        NSNotificationCenter.defaultCenter()
            .addObserver(self, selector:"updateDepartureCollection:", name: "updateTimeTableCollectionNotification", object: nil)
        
        super.viewDidLoad()
    }
    
    func updateStopsCollection(notification: NSNotification){
        let userInfo = notification.userInfo as [String: AnyObject]
        self.stopsCollection = userInfo["stopsCollection"] as [Stop]
        
        stopsTable.stopsCollection = self.stopsCollection
        stopsTable.reloadData()
    }
    
    func updateDepartureCollection(notification: NSNotification){
        let userInfo = notification.userInfo as [String: AnyObject]
        self.timeTableCollection = userInfo["timeTablesCollection"] as [TimeTable]
        
        timetablesTable.timeTableCollection = self.timeTableCollection
        timetablesTable.reloadData()
    }
    
    
}






