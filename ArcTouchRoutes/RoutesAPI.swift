//
//  RoutesAPI.swift
//  ArchTouchRoutes
//
//  Created by Marcelo Oliveira on 5/27/15.
//  Copyright (c) 2015 Marcelo Oliveira. All rights reserved.
//  Explanation - Contains necessary methods to acess API

let findRoutesURL = "https://api.appglu.com/v1/queries/findRoutesByStopName/run";
let findStopsURL = "https://api.appglu.com/v1/queries/findStopsByRouteId/run";
let findDeparturesURL = "https://api.appglu.com/v1/queries/findDeparturesByRouteId/run";


class RoutesAPI: NSObject {
    private let httpClient: HTTPClient!
    
    override init(){
        httpClient = HTTPClient()
        super.init()
    }
    
    
    func findRoutesByStopName(stopName: String) {
        var parameters = buildPayload("stopName", value: "%\(stopName)%")
        httpClient.postRequest(findRoutesURL, body: parameters)
    }
    
    func findStopsByRouteId(routeId: Int){
        var parameters = buildPayload("routeId", value: routeId)
        httpClient.postRequest(findStopsURL, body: parameters)
    }
    
    func findDeparturesByRouteId(routeId: Int){
        var parameters = buildPayload("routeId", value: routeId)
        httpClient.postRequest(findDeparturesURL, body: parameters)
    }
    
    
    
    class var sharedInstance: RoutesAPI {
        struct Singleton {
            static let instance = RoutesAPI()
        }
        return Singleton.instance
    }
    
    func buildPayload(valueName: String, value: AnyObject) -> [String: [String: AnyObject]] {
        var insideParams:[String: AnyObject] = [valueName: value]
        var finalPayload: [String: [String: AnyObject]] = ["params": insideParams]
        return finalPayload
    }
}
