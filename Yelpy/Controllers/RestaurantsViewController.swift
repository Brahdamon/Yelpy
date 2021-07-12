//
//  ViewController.swift
//  Yelpy
//
//  Created by Memo on 5/21/20.
//  Copyright © 2020 memo. All rights reserved.
//

import UIKit
import AlamofireImage

class RestaurantsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var restaurantTableView: UITableView!
    @IBOutlet weak var restaurantImageView: UIImageView!
    @IBOutlet weak var restaurantDescriptionLabel: UILabel!
    
    
    // ––X–– TODO: Add storyboard Items (i.e. tableView + Cell + configurations for Cell + cell outlets)
    // ––X–– TODO: Next, place TableView outlet here
    
    // –––X––– TODO: Initialize restaurantsArray
    // restaurantsArray is a list of dictionaries gotten ffrom the JSON file
    var restaurantsArray: [[String:Any]] = []
    
    
    
    // ––––– TODO: Add tableView datasource + delegate. These are added into the override func viewDidLoad() function.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        restaurantTableView.delegate = self
        restaurantTableView.dataSource = self
        
        restaurantTableView.rowHeight = 150
        
        getAPIData()
        

    }
    
    
    // –––X–– TODO: Get data from API helper and retrieve restaurants
    
    func getAPIData(){
        API.getRestaurants(){(restaurants) in
            guard let restaurants = restaurants else {
                return
            }
            print(restaurants)
            self.restaurantsArray = restaurants
            self.restaurantTableView.reloadData() //reload the data!
        }
        
        
        
}

// ––––– TODO: Create tableView Extension and TableView Functionality


    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Create Restaurant Cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell") as! RestaurantCell
       // create a variable that stores the ith dictionary of restaurant values from the JSON file. (Values pertaining to a specific restaurant)
        let restaurant = restaurantsArray[indexPath.row]
        
        //Set label to restaurant name for each cell
        
        cell.descriptionLabel.text = restaurant["name"] as? String ?? ""
        
        //set image of restaurant
        if let imageUrlString = restaurant["image_url"] as? String {
            let imageUrl = URL(string: imageUrlString)
            cell.restaurantView.af.setImage(withURL: imageUrl!)
        }
       
        return cell
    }
}
