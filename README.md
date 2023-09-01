# Martian Robot

    This is an iOS app that displays a list of planets and their information. The app is written in Swift and uses Core Data for persistence and the MVVM architecture with the Repository pattern.

## Project Description 

This is a playground code with testcases that defines a robot struct to keep track of each robot's position on the grid, orientation and also keeps track
of its wherebout to know if its lost. The orientations are represented using an array, and the dx and dy arrays to store the changes in coordinates based 
based on the current orientation. The processRobots function parses the input and processes each robot's instructions, updating their position and 
orientation accordingly.
Regarding testing, i have used XCtest Framework to test various edge cases. These test cases covers scenarios where there is a single robot, multiple robots,
robots getting lost and robots moving out of the grid's boundaries.

## Table of Contents

In the structure files contains: a single files with a robot struct, processRobots function,  RobotNavigationTests class


# Installation
Can be used with Xcode playground to run both the the program and test cases.

# Framework
XCtest Framework, Foundation 

# Architecture
None

# Offline Storage
None

# Design Patterns
None

# Testing
Units tests for success and failure situations.

