//
//  AuthenticationServiceImplementation.swift
//  SwiftMocking
//
//  Created by Марк on 23.06.17.
//
//

class AuthenticationServiceImplementation: AuthenticationService {
    
    func authenticate(with login: AuthenticationService.Login,
                      and password: AuthenticationService.Password) -> AuthenticationService.isSucces {
        return true
    }
    
    func asyncAuthenticate(with login: AuthenticationService.Login,
                           and password: AuthenticationService.Password,
                           and authenticationHandler: @escaping (AuthenticationService.isSucces) -> Void) {
        authenticationHandler(true)
    }
    
}
