//
//  TDDPracticeTests.swift
//  TDDPracticeTests
//
//  Created by Administrator on 10/12/22.
//

import XCTest

class FizzBuzz {
    func fizzBuzz(num : Int) -> String {
        if num % 3 == 0 && num % 5 == 0 {
            return "FizzBuzz"
        }
        if num % 3 == 0 {
            return "Fizz"
        }
        if num % 5 == 0 {
            return "Buzz"
        }
        return String(num)
    }
}

final class FizzBuzzTests: XCTestCase {
    
    func test_fizzbuzz_returnsIntAsString() throws {
        let sut = FizzBuzz()
        let num = 2
        let str = "2"
        XCTAssertEqual(str, sut.fizzBuzz(num: num))
    }
    
    func test_fizzbuzz_returnsFizzWheNumberIsMultipleOfThree() {
        let sut = FizzBuzz()
        let num = 3
        let str = "Fizz"
        XCTAssertEqual(str, sut.fizzBuzz(num: num))
    }
    func test_fizzbuzz_returnsBuzzWheNumberIsMultipleOfFive() {
        let sut = FizzBuzz()
        let num = 5
        let str = "Buzz"
        XCTAssertEqual(str, sut.fizzBuzz(num: num))
    }
    func test_fizzbuzz_returnsFizzBuzzWheNumberIsMultipleOfFiveAndThree() {
        let sut = FizzBuzz()
        let num = 15
        let str = "FizzBuzz"
        XCTAssertEqual(str, sut.fizzBuzz(num: num))
    }
}

    
