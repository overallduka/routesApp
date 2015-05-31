//
//  StopTableView.swift
//  ArchTouchRoutes
//
//  Created by Marcelo Oliveira on 5/30/15.
//  Copyright (c) 2015 Marcelo Oliveira. All rights reserved.
//

import UIKit

class TimetableTableView:UITableView {
    
    
    var timeTableCollection: [TimeTable]!
    var sectionsTitles: [String]!
    var sectionsData: [AnyObject]!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        timeTableCollection = []
        sectionsData = []
        self.sectionsTitles = ["WEEKDAY", "SUNDAY", "SATURDAY"]
        
        self.delegate = self
        self.dataSource = self
    }
    
    override func reloadData() {
        createSectionsData()
        super.reloadData()
    }
    
    func createSectionsData() {
        
        var weekDayTimetables = timeTableCollection.filter({
            (timetable: TimeTable) -> Bool  in
            timetable.calendar == "WEEKDAY"
        })
        
        var sundayTimetables = timeTableCollection.filter({
            (timetable: TimeTable) -> Bool  in
            timetable.calendar == "SUNDAY"
        })
        
        var satudayTimetables = timeTableCollection.filter({
            (timetable: TimeTable) -> Bool  in
            timetable.calendar == "SATURDAY"
        })
        self.sectionsData = [weekDayTimetables, sundayTimetables, satudayTimetables]
    }
    
}

extension TimetableTableView : UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellID: String =  "Cell"
        var cell: UITableViewCell?
        
        cell = tableView.dequeueReusableCellWithIdentifier(cellID) as? UITableViewCell
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellID)
        }
        
        var array = self.sectionsData[indexPath.section] as NSArray
        
        var timeTable = array[indexPath.row] as TimeTable
        
        cell!.textLabel?.text  = timeTable.time
        
        return cell!
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sectionsData.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionsData[section].count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionsTitles[section]
    }
    
}

extension TimetableTableView : UITableViewDelegate {
    
    
}
