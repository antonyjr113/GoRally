//
//  GoRallyTests.swift
//  GoRallyTests
//
//  Created by Don Wolfton on 26.10.23.
//

import XCTest

@testable import GoRally

final class GoRallyTests: XCTestCase {

    func testFulfilLoginFormIncorerect() {
        let loginVC = LoginViewController()
        loginVC.nameField.text = "nodscnosdnco"
        loginVC.passwordField.text = "fjovnfonv"

        loginVC.loginButtonTap()

        XCTAssertEqual(loginVC.isSuccessLogin, false)

        print("\ntestFulfilLoginFormIncorerec = \(loginVC.isSuccessLogin)\n")
    }

    func testFulfilLoginFormIncorerectPass() {
        let loginVC = LoginViewController()
        loginVC.nameField.text = "86"
        loginVC.passwordField.text = "fjovnfonv"

        loginVC.loginButtonTap()

        XCTAssertEqual(loginVC.isSuccessLogin, false)
        print("\n\(loginVC.isSuccessLogin)\n")
    }

    func testFulfilLoginFormIncorerectName() {
        let loginVC = LoginViewController()
        loginVC.nameField.text = "nodscnosdnco"
        loginVC.passwordField.text = "4786"

        loginVC.loginButtonTap()
        XCTAssertEqual(loginVC.isSuccessLogin, false)
        //print("\n\(loginVC.isSuccessLogin)")
    }

    func testFulfilLoginFormCorrect() {
        let loginVC = LoginViewController()
        loginVC.nameField.text = "12"
        loginVC.passwordField.text = "2112"

        loginVC.loginButtonTap()

        XCTAssertEqual(loginVC.isSuccessLogin, true)

        print("\ntestFulfilLoginFormCorrect = \(loginVC.isSuccessLogin)")
    }

    func testFulfilLoginFormWithEmptyFileds() {
        let loginVC = LoginViewController()
        loginVC.nameField.text = ""
        loginVC.passwordField.text = ""

        loginVC.loginButtonTap()

        XCTAssertEqual(loginVC.isSuccessLogin, false)

        print("\ntestFulfilLoginFormCorrect = \(loginVC.isSuccessLogin)")
    }

    func testIncorrectLatLongInStartpoint() {
        let rallyVC = RallyViewController()
        
    }
}
