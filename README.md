### <p align="center"><img width = "150px" height="150px" src="https://raw.githubusercontent.com/j-koreth/VIN-Bladel/master/VIN-Bladel/Assets.xcassets/AppIcon.appiconset/Icon-App-83.5x83.5%402x.png"></p>

# VIN-Bladel
An iOS app that manages the John Hersey High School Automobile Repair service.
Our app utilizes Firebase to store the customers, vehicles, past invoices, and the parts and services offered. The user can scan/type in a car VINS or search a customer by name to bring up the information of an old vehicle or to add a new customer/car to the database. The students doing the repairs have the option to select the maintenance they're doing and send an invoice to the customer's email when the repair is complete. 

## Features
* Scan or manually input a VIN or even look up an old customer by name to pull up their information and their vehicle. Uses the [NHTSA API](https://vpic.nhtsa.dot.gov/api/)
 * Displays the following keys from the API
   * Make
   * Model 
   * Model Year
   * Displacement
   * Cylinder
   * Transmission
   * Drive type
   * Submodel
   
* Firebase Integration
 * Add a new customer and identify and update a previous customer
 * Add a new customer and identify and update a previous vehicle
 * Look through a vehicle's past maintenance history and update when new reports are made
  

## Installation
Install [Firebase](https://firebase.google.com/docs/ios/setup#add_the_sdk) 

``` sh
git clone https://github.com/j-koreth/VIN-Bladel.git
cd VIN-Bladel
pod init
```
