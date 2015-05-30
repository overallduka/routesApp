//
//  StopTableView.swift
//  ArchTouchRoutes
//
//  Created by Marcelo Oliveira on 5/30/15.
//  Copyright (c) 2015 Marcelo Oliveira. All rights reserved.
//

import UIKit

class StopTableView:UITableView {
    
    
    var stopsCollection: [Stop]!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        stopsCollection = []
        self.delegate = self
        self.dataSource = self
    }
    
    
    override func reloadData() {
        stopsCollection.sort { ($0 as Stop).name < ($1 as Stop).name }
        super.reloadData()
    }
    
    
}


extension StopTableView : UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellID: String =  "Cell"
        var cell: UITableViewCell?
        
        cell = tableView.dequeueReusableCellWithIdentifier(cellID) as? UITableViewCell
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellID)
        }
        
        
        
        var stop = self.stopsCollection[indexPath.row] as Stop
        
        cell!.textLabel?.font = UIFont(name: "ArialMT", size: 12.0)
        cell!.textLabel?.text  = stop.name
        
        return cell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.stopsCollection.count
    }
    
}

extension StopTableView : UITableViewDelegate {
    
    
}
