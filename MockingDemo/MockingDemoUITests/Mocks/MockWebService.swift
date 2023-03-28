//
//  MockWebService.swift
//  MockingDemoUITests
//
//  Created by Meric Alp on 28.03.2023.
//

import Foundation

class MockWebService: NetworkService {
    func login(username: String, password: String, completion: @escaping (Result<Void, NetworkError>) -> Void) {
        
        if username == "MericAlp" && password == "Password"{
            completion(.success(()))
        }else {
            completion(.failure(.notAuthenticated))
        }
        
    }
}
