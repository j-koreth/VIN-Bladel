# VIN-Bladel
An iOS app to decode VINs powered by the [NHTSA API] (https://vpic.nhtsa.dot.gov/api/).

## Features
* Input a VIN through using the built-in scanner or manually
* Displays the following keys from the API
  * Make
  * Model 
  * Model Year
  * Displacement
  * Cylinder
  * Transmission
  * Drive type
  * Submodel [Incomplete]
* Firebase Integration
  * Identify previous customers
  * Add new customers
  * Add new vehicles to customers

## Installation
Install [Firebase](https://firebase.google.com/docs/ios/setup#add_the_sdk) 

``` sh
git clone https://github.com/j-koreth/VIN-Bladel.git
cd VIN-Bladel
pod init
```
