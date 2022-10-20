//
//  GreetingTests.swift
//  TDDPracticeTests
//
//  Created by Administrator on 10/20/22.
//

import XCTest

class Greeter {
    func greet(_ name : String?) -> String {
        if let name = name {
            if name.isUpperCased() {
                return shout(name)
            }
            return "Hello, \(name)."
        }
        return greetStranger()
    }
    
    func greet(_ names : [String]) -> String {
        if names.count == 0 {
            return greet(nil)
        } else if names.count == 1 {
            return greet(names[0])
        } else if names.count == 2 {
            return "Hello, \(names[0]) and \(names[1])."
        } else {
            var string = "Hello, "
            for (index, name) in names.enumerated() {
                if index == names.count - 1 {
                    string = string + "and " + name + "."
                } else {
                    string = string + name + ", "
                }
            }
            return string
        }
    }
    
    
//    private func separateHellosAndShouts(_ names : [String]) -> (hellos : [String], shouts : [String]) {
//        var hellos : [String] = []
//        var shouts : [String] = []
//
//        for name in names {
//            if name.isUpperCased() {
//                shouts.append(name)
//            } else {
//                hellos.append(name)
//            }
//        }
//        return (hellos, shouts)
//    }
    
    private func shout(_ name : String) -> String {
        return "HELLO \(name)!"
    }
    
    private func greetStranger() -> String {
        return "Hello, my friend."
    }
    
}

extension String {
    func isUpperCased() -> Bool {
        for char in self {
            if char.isLowercase {
                return false
            }
        }
        return true
    }
}

final class GreetingTests: XCTestCase {

    func testGreeter_saysHelloToGivenName() throws {
        let sut = Greeter()
        let name = "Bob"
        
        let greeting = sut.greet(name)
        
        XCTAssertEqual(greeting, "Hello, Bob.")
    }
    
    func test_greet_saysGenericHelloWhenNoNameIsGiven() {
        let sut = Greeter()
        let name : String? = nil
        
        let greeting = sut.greet(name)
        
        XCTAssertEqual(greeting, "Hello, my friend.")
    }
    
    func test_greet_shoutsWhenUserProvidesCapitalizedName() {
        let sut = Greeter()
        let name = "JERRY"
        
        let greeting = sut.greet(name)
        
        XCTAssertEqual(greeting, "HELLO JERRY!")
    }
    
    func test_greet_saysHelloToTwoPeopleWhenTwoNamesAreGiven() {
        let sut = Greeter()
        let names = ["Jill", "Jane"]
        
        let greeting = sut.greet(names)
        
        XCTAssertEqual(greeting, "Hello, Jill and Jane.")
    }
    
    func test_greet_saysHelloToMultiplePeopleWhenMoreThanTwoNamesAreGiven() {
        let sut = Greeter()
        let names = ["Amy", "Brian", "Charlotte"]
        
        let greeting = sut.greet(names)
        
        XCTAssertEqual(greeting, "Hello, Amy, Brian, and Charlotte.")
    }
    
//    func test_greet_allowsMixingOfNormalAndShoutedNames() {
//        let sut = Greeter()
//        let names = ["Amy", "BRIAN", "Charlotte"]
//
//        let greeting = sut.greet(names)
//
//        XCTAssertEqual(greeting, "Hello, Amy and Charlotte. AND HELLO BRIAN!")
//    }
}
