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
    var authenticateReceivedArguments: (login: String, password: String)?
    var authenticateReturnValue: Bool!

    func authenticate(with login: String, and password: String) -> Bool {
        authenticateCalled = true
        authenticateReceivedArguments = (login: login, password: password)
        return authenticateReturnValue
    }
}
