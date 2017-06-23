//
//  ViewController.swift
//  SwiftMocking
//
//  Created by Марк on 23.06.17.
//
//

import UIKit

class ViewController: UIViewController {
    
    var authenticationService: AuthenticationService = AuthenticationServiceImplementation()
    var login = "Login"
    var password = "Password"

    override func viewDidLoad() {
        super.viewDidLoad()
        let isAuthenticated = authenticationService.authenticate(with: login, and: password)
        isAuthenticated ? print("Добро пожаловать") : print("В доступе отказано")
    }

}

