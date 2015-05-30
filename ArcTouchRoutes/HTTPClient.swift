//
//  HTTPClient.swift
//  ArchTouchRoutes
//
//  Created by Marcelo Oliveira on 5/27/15.
//  Copyright (c) 2015 Marcelo Oliveira. All rights reserved.
//  Explanation - Make the httpRequests and sent to Router to redirect this data to controller

import Foundation

class HTTPClient {
    private let API_USERNAME = "WKD4N7YMA1uiM8V"
    private let API_PASSWORD = "DtdTtzMLQlA0hk2C1Yi5pLyVIlAQ68"
    
    
    private var manager: AFHTTPRequestOperationManager!
    private var serializer: AFJSONRequestSerializer!
    
    init(){
        manager = AFHTTPRequestOperationManager()
        serializer = AFJSONRequestSerializer(writingOptions: NSJSONWritingOptions.allZeros)
        
        serializer.setAuthorizationHeaderFieldWithUsername(API_USERNAME, password: API_PASSWORD)
        
        serializer.setValue("staging", forHTTPHeaderField: "X-AppGlu-Environment")
        serializer.setValue("application/json", forHTTPHeaderField: "Content-Type")
        serializer.setValue("application/json", forHTTPHeaderField: "Accept")
        
        manager.requestSerializer = serializer
    }
    
    
    func postRequest(url: String, body: AnyObject) -> (AnyObject){
        
        var parameters: AnyObject = body
        
        manager.POST(url,
            parameters: parameters,
            success: {
                (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
                var requestResponse = (responseObject as NSDictionary)
                ResponseRouter(requestResponse: requestResponse)
            },
            failure: {
                (operation: AFHTTPRequestOperation!, error: NSError!) in
                var alert : UIAlertView = UIAlertView()
                alert.addButtonWithTitle("OK")
                alert.title = "Warning"
                alert.message = "Error on your request, try again !"
                alert.show()
            }
            
        )
        return NSData()
    }
    
}
