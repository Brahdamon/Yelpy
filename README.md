# Yelpy






Yelpy App is a clone that displays in this case Restaurants from around Altadena, CA



### User Stories


- [ x ] (5pts) User sees a list of restaurants in the area with their names and pictures
- [ x ] (5pts) User can scroll down a list of these items


### App Walkthrough GIF


<img src="https://imgur.com/axqkqnv.gif" width=250><br>

### Notes
Describe any challenges encountered while building the app.



1.
for setting tableViewDataSource and tableViewDelegate, be sure to use the correct reference name for tableView in

tableView.delegate = self
tableView.dataSource = self

I changed the reference name for the table view to restaurantTableView and needed to update these in the above code

2.
Be sure to cast as! correct object type. I forgot to and it was difficult to find the error


3.
Experienced an error due to incorrect capitalization on my part. Wrote "Pod" instead of "pod". Cap. errors are common causes for errors!
