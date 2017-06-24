// Generated using Sourcery 0.7.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable line_length

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif


class AuthenticationServiceMock: AuthenticationService {

    //MARK: - authenticate

    var authenticateCalled = false
    var authenticateReceivedArguments: (login: Login, password: Password)?
    var authenticateReturnValue: isSucces!

    func authenticate(with login: Login, and password: Password) -> isSucces {
        authenticateCalled = true
        authenticateReceivedArguments = (login: login, password: password)
        return authenticateReturnValue
    }
    //MARK: - asyncAuthenticate

    var asyncAuthenticateCalled = false
    var asyncAuthenticateReceivedArguments: (login: Login, password: Password, authenticationHandler: (isSucces) -> Void)?

    func asyncAuthenticate(with login: Login, and password: Password, and authenticationHandler: @escaping (isSucces) -> Void) {
        asyncAuthenticateCalled = true
        asyncAuthenticateReceivedArguments = (login: login, password: password, authenticationHandler: authenticationHandler)
    }
}
