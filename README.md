# Airport Challenge 

```     
                       --====|====--
                             |  

                         .-"""""-. 
                       .'_________'. 
                      /_/_|__|__|_\_\
                     ;'-._       _.-';
,--------------------|    `-. .-'    |--------------------,
 ``""--..__    ___   ;       '       ;   ___    __..--""``
           `"-// \\.._\             /_..// \\-"`
              \\_//    '._       _.'    \\_//
               `"`        ``---``        `"`                                                    
```
##### [*OVERVIEW*](#Overview) | [*HOW TO USE*](#How-to-use) | [*SCOPE*](#scope) | [*USER REQUIREMENTS*](#User-Requirements )
___

## Overview

Weekend challenge at Makers Academy to build a command line application that emulates the functionality of an air traffic controller. This application was built using specific user requirements with Ruby and implements a TDD approach whilst covering multiple edge cases.

A user is able to create a new Airport, and initiate planes to land them in and take-off from. Airports can be initiated with a default capacity to determine how many planes it can store. A user is unable to make 'land' and 'take-off' requests to a plane during bad weather conditions. When a plane lands or takes off successfully, the user is informed and the plane will log a timestamp.


## How to use

Oyster-card runs directly from the command line, install either by cloning or forking the repository. Change directory to the root folder and run bundle install.

```
$ bundle install
```
Open irb, and enter the following to run the application.

```
$ require './lib/airport.rb'
 => true
```
To run the tests for the application, run RSpec.

```
$ rspec
```

## Scope

**Airport** (*Airport.new*)
-	Initiates a new airport, a capacity can be set, however defaults to 5 if a user chooses not to.
-	A user can request to land a plane at the airport.
-	A user can request to take-off a plane from the airport.
-	Airports will not allow a plane to land if the airport is at capacity.
-	Airports will not allow a plane to land or take-off during bad weather.


**Plane** (*Plane.new*)
-	Initiates a new plane.
-	A plane can not be landed if it is airborne.
-	A plane can not take-off if it is already airborne.
-	A plane records a timestamp every time it lands or takes off.


**Weather**
- Randomly generated weather that determines good flying conditions

## User Requirements

---------

We have a request from a client to write the software to control the flow of planes at an airport:

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
```
```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```
```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```
```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy
```
```
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```
--------

