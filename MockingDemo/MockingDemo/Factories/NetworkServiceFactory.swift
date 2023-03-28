//
//  NetworkServiceFactory.swift
//  MockingDemo
//
//  Created by Meric Alp on 28.03.2023.
//

import Foundation

class NetworkServiceFactory {
    
    static func create() -> NetworkService{
        let environment = ProcessInfo.processInfo.environment["ENV"]
        
        if let environment = environment{
            if environment == "TEST"{
                return MockWebService()
            }else{
                return Webservice()
            }
        }else{
            return Webservice()
        }
        
    }
    
}
