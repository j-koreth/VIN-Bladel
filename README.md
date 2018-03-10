### <p align="center"><img width = "150px" height="150px" src="https://raw.githubusercontent.com/j-koreth/VIN-Bladel/master/VIN-Bladel/Assets.xcassets/AppIcon.appiconset/Icon-App-83.5x83.5%402x.png"></p>

# VIN-Bladel
An iOS app that manages the John Hersey High School Automobile Repair service.

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
  * Add a new customer or identify previous customers
  * Add a new customer or identify a previous vehicle
  * Look through a vehicle's past maintenance history
  * Allows the user to update any informatiion of the vehicle or customer
  
* 

## Installation
Install [Firebase](https://firebase.google.com/docs/ios/setup#add_the_sdk) 

``` sh
git clone https://github.com/j-koreth/VIN-Bladel.git
cd VIN-Bladel
pod init
```
