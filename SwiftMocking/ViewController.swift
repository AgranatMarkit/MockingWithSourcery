//
//  ViewController.swift
//  SwiftMocking
//
//  Created by Марк on 23.06.17.
//
//

import UIKit

class ViewController: UIViewController {
    
    var authenticationService: AuthenticationService!
    var login = "Login"
    var password = "Password"
    
    /// Обработчик аутентификации, используется для асинхронной аутентификации
    var aunthenticationHandler: ((Bool) -> Void) = { (isAuthenticated) in
        print("\nРезультат асинхронной функции:")
        isAuthenticated ? print("Добро пожаловать") : print("В доступе отказано")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        authenticationService = AuthenticationServiceImplementation() // Какая-то реализация сервиса аутентификации, нам не важно, т.к. тестировать мы будем viewController
        performAuthentication()
        performAsyncAuthentication()
    }
    
    func performAuthentication() {
        let isAuthenticated = authenticationService.authenticate(with: login, and: password)
        print("Результат синхронной функции:")
        isAuthenticated ? print("Добро пожаловать") : print("В доступе отказано")
    }
    
    func performAsyncAuthentication() {
        authenticationService.asyncAuthenticate(with: login, and: password, and: aunthenticationHandler)
    }

}


class MockAuthenticationService: AuthenticationService {
    
    var emulatedResult: Bool? // То, что вернёт синхронная функция аутентификации
    var receivedLogin: AuthenticationService.Login? // Поле для проверки полученния логина
    var receivedPassword: AuthenticationService.Password? // Поле для проверки полученния пароля
    var receivedAuthenticationHandler: ((AuthenticationService.isSucces) -> Void)? // Обработчик, с помощью которого будем управлять возвращаемым значением при тестировании функции асинхронной аутетнификации
    
    func authenticate(with login: AuthenticationService.Login,
                      and password: AuthenticationService.Password) -> AuthenticationService.isSucces {
        receivedLogin = login
        receivedPassword = password
        return emulatedResult ?? false
    }
    
    func asyncAuthenticate(with login: AuthenticationService.Login,
                           and password: AuthenticationService.Password,
                           and authenticationHandler: @escaping (AuthenticationService.isSucces) -> Void) {
        receivedLogin = login
        receivedPassword = password
        receivedAuthenticationHandler = authenticationHandler
    }
    
}
