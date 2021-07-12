//
//  File.swift
//  Yelpy
//
//  Created by Memo on 5/21/20.
//  Copyright © 2020 memo. All rights reserved.
//

import Foundation


struct API {
    

    
    static func getRestaurants(completion: @escaping ([[String:Any]]?) -> Void) {
        
        // –––X–– TODO: Add your own API key!
        let apikey = "q7D_hdsFZBpT8Y57TBHGlTDyHTH2-MS_KXErnBnsBtPvNLWYlLw5lO-y3wb9quCMPox9BnW38LN5J8iI-8ZNcQCszyo-EMNCAzbzzXANDqswYQaO394WZixVOf_qYHYx"
        
        // Coordinates for Altadena
        //34.1902° N, 118.1313° W
        
        let lat = 34.1902
        let long = -118.1313
        
        
        let url = URL(string: "https://api.yelp.com/v3/transactions/delivery/search?latitude=\(lat)&longitude=\(long)")!
        
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        // Insert API Key to request
        request.setValue("Bearer \(apikey)", forHTTPHeaderField: "Authorization")
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {

                // ––––– TODO: Get data from API and return it using completion
                print(data)
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
                
                print(dataDictionary)
                
                let restaurants = dataDictionary["businesses"] as! [[String:Any]]
                
                
                
                return completion(restaurants)
                
                }
            }
        
            task.resume()
        
        }
    }

    
