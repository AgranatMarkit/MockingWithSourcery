//
//  SwiftMockingTests.swift
//  SwiftMockingTests
//
//  Created by Марк on 23.06.17.
//
//

import XCTest
@testable import SwiftMocking

class SwiftMockingTests: XCTestCase {
    
    var viewController: ViewController!
    var authenticationService: AuthenticationServiceMock!
    
    override func setUp() {
        super.setUp()
        authenticationService = AuthenticationServiceMock()
        viewController = ViewController()
        viewController.authenticationService = authenticationService!
    }
    
    func testViewDidLoad() {
        // given
        viewController.login = "Test login"
        viewController.password = "Test password"
        authenticationService.authenticateReturnValue = true
        
        // when
        viewController.viewDidLoad()
        
        // then
        XCTAssert(authenticationService.authenticateCalled)
        XCTAssert(authenticationService.authenticateReceivedArguments?.login == viewController.login)
        XCTAssert(authenticationService.authenticateReceivedArguments?.password == viewController.password)
    }
    
}
