//
//  ViewController.swift
//  ArchTouchRoutes
//
//  Created by Marcelo Oliveira on 5/27/15.
//  Copyright (c) 2015 Marcelo Oliveira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var routesTable: UITableView!
    @IBOutlet weak var stopName: UITextField!
    
    var routesCollection: [Route]!
    var selectedRoute: Route!
    
    @IBAction func searchStart(sender: AnyObject) {
        RoutesAPI.sharedInstance.findRoutesByStopName(stopName.text)
    }
    
    
    override func viewDidLoad() {
        self.routesCollection = []
        
        NSNotificationCenter.defaultCenter().addObserver(self,selector:"updateRoutesTable:",name: "updateTableRoutesNotification", object: nil)
        
        routesTable.delegate = self
        routesTable.dataSource = self
        self.view.addSubview(routesTable!)
        
        super.viewDidLoad()
    }
    
    
    func updateRoutesTable(notification: NSNotification){
        let userInfo = notification.userInfo as [String: AnyObject]
        
        self.routesCollection = userInfo["routesCollection"] as [Route]
        
        self.routesTable.reloadData()
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if  segue.identifier == "segueShowRouteDetails" {
            var result = segue.destinationViewController as RouteDetailsController
            result.currentRoute = self.selectedRoute
        }
    }
    
    
}




extension ViewController : UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellID: String =  "Cell"
        var cell: UITableViewCell?
        
        cell = self.routesTable.dequeueReusableCellWithIdentifier(cellID) as? UITableViewCell
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellID)
        }
        
        var route = self.routesCollection[indexPath.row] as Route
        
        cell!.textLabel?.text  = route.longName
        cell!.detailTextLabel?.text = route.shortName
        
        return cell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.routesCollection.count
    }
    
}

extension ViewController : UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.selectedRoute = self.routesCollection[indexPath.row]
        self.performSegueWithIdentifier("segueShowRouteDetails", sender: self)
    }
    
    
}

