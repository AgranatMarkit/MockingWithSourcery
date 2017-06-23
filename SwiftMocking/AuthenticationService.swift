//
//  AuthenticationService.swift
//  SwiftMocking
//
//  Created by Марк on 23.06.17.
//
//

protocol AuthenticationService: AutoMockable {
    
    func authenticate(with login: String, and password: String) -> Bool
    
}
