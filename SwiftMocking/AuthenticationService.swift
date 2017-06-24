//
//  AuthenticationService.swift
//  SwiftMocking
//
//  Created by Марк on 23.06.17.
//
//

protocol AuthenticationService: AutoMockable {
    
    typealias Login = String
    typealias Password = String
    typealias isSucces = Bool
    
    
    /// Функция аутентификации пользователя
    ///
    /// - Parameters:
    ///   - login: Учётная запись
    ///   - password: Пароль
    /// - Returns: Успешность аутентификации
    func authenticate(with login: Login, and password: Password) -> isSucces
    
    
    /// Асинхронная функция аутентификации пользователя
    ///
    /// - Parameters:
    ///   - login: Учётная запись
    ///   - password: Пароль
    ///   - authenticationHandler: Callback(completionHandler) аутентификации
    func asyncAuthenticate(with login: Login, and password: Password, and authenticationHandler: @escaping (isSucces) -> Void)
    
}
