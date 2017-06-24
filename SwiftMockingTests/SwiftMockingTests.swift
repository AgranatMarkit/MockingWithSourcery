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
        viewController.authenticationService = authenticationService
        viewController.login = "Test login"
        viewController.password = "Test password"
    }
    
    func testPerformAuthentication() {
        // given
        authenticationService.authenticateReturnValue = true
        
        // when
        viewController.performAuthentication()
        
        // then
        XCTAssert(authenticationService.authenticateReceivedArguments?.login == viewController.login, "Логин не был передан в функцию аутентификации")
        XCTAssert(authenticationService.authenticateReceivedArguments?.password == viewController.password, "Пароль не был передан в функцию аутентификации")
        XCTAssert(authenticationService.authenticateCalled, "Не произошёл вызова функции аутентификации")
    }
    
    func testPerformAsyncAuthentication() {
        // given
        var isAuthenticated = false
        viewController.aunthenticationHandler = { isAuthenticated = $0 }
        
        // when
        viewController.performAsyncAuthentication()
        authenticationService.asyncAuthenticateReceivedArguments?.authenticationHandler(true)
        
        // then
        XCTAssert(authenticationService.asyncAuthenticateCalled, "Не произошёл вызов асинхронной функции аутентификации")
        XCTAssert(authenticationService.asyncAuthenticateReceivedArguments?.login == viewController.login, "Логин не был передан в асинхронную функцию аутентификации")
        XCTAssert(authenticationService.asyncAuthenticateReceivedArguments?.password == viewController.password, "Пароль не был передан в асинхронную функцию аутентификации")
        XCTAssert(isAuthenticated, "Контроллер не обрабтывает результат аутентификации")
    }
    
}
