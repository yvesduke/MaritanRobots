


import UIKit

import Foundation

struct Robot {
    var x: Int
    var y: Int
    var orientation: Character
    var isLost: Bool = false
}

let orientations: [Character] = ["N", "E", "S", "W"]

let dx: [Int] = [0, 1, 0, -1]
let dy: [Int] = [1, 0, -1, 0]

func processRobots(input: String) -> [String] {
    let lines = input.components(separatedBy: "\n")
    var gridSize = lines[0].split(separator: " ").map { Int($0)! }
    var results: [String] = []
    
    for i in stride(from: 1, to: lines.count, by: 2) {
        let position = lines[i].split(separator: " ")

        var robot = Robot(x: Int(position[0])!, y: Int(position[1])!, orientation: Character(position[2].uppercased()))
        
        let instructions = Array(lines[i + 1])
        for instruction in instructions {
            if instruction == "L" {
                let currentOrientationIndex = orientations.firstIndex(of: robot.orientation)!
                robot.orientation = orientations[(currentOrientationIndex + 3) % 4]
            } else if instruction == "R" {
                let currentOrientationIndex = orientations.firstIndex(of: robot.orientation)!
                robot.orientation = orientations[(currentOrientationIndex + 1) % 4]
            } else if instruction == "F" {
                let currentOrientationIndex = orientations.firstIndex(of: robot.orientation)!
                let newX = robot.x + dx[currentOrientationIndex]
                let newY = robot.y + dy[currentOrientationIndex]
                
                if newX >= 0 && newY >= 0 && newX <= gridSize[0] && newY <= gridSize[1] {
                    robot.x = newX
                    robot.y = newY
                } else if !robot.isLost {
                    robot.isLost = true
                    break
                }
            }
        }
        
        results.append(robot.isLost ? "\(robot.x)\(robot.y)\(robot.orientation)LOST" : "\(robot.x)\(robot.y)\(robot.orientation)")
    }
    
    return results
}

let input = """
5 3
1 1 E
RFRFRFRF
3 2 N
FRRFLLFFRRFLL
0 3 W
LLFFFLFLFL
"""

let output = processRobots(input: input)
for line in output {
    print(line)
}

import XCTest

class RobotNavigationTests: XCTestCase {
    
    func testSingleRobotNoLost() {
        let input = """
        5 3
        1 1 E
        RFRFRFRF
        """
        let expectedOutput = ["11E"]
        XCTAssertEqual(processRobots(input: input), expectedOutput)
    }

    func testSingleRobotWithLost() {
        let input = """
        5 3
        3 2 N
        FRRFLLFFRRFLL
        """
        let expectedOutput = ["33NLOST"]
        XCTAssertEqual(processRobots(input: input), expectedOutput)
    }
    
    func testMultipleRobotsNoLost() {
        let input = """
        5 3
        1 1 E
        RFRFRFRF
        3 2 N
        FRRFLLFFRRFLL
        """
        let expectedOutput = ["11E", "33NLOST"]
        XCTAssertEqual(processRobots(input: input), expectedOutput)
    }
    
    func testMultipleRobotsWithLost() {
        let input = """
            5 3
            1 1 E
            RFRFRFRF
            0 3 W
            LLFFFLFLFL
            """
        let expectedOutput = ["11E", "33NLOST"]
        XCTAssertEqual(processRobots(input: input), expectedOutput)
    }
    
    
    func testRobotsOutOfRange() {
        let input = """
        5 3
        1 1 E
        FFFFFFFF
        """
        let expectedOutput = ["51ELOST"]
        XCTAssertEqual(processRobots(input: input), expectedOutput)
    }

    
    func testEmptyInput() {
        let input = ""
        let expectedOutput: [String] = []
        XCTAssertEqual(processRobots(input: input), expectedOutput)
    }
}

// Run the tests
let testSuite = RobotNavigationTests.defaultTestSuite
testSuite.run()



//MartianRobotsTests.defaultTestSuite.run()
