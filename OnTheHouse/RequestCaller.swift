//
//  RequestCaller.swift
//  OnTheHouse
//
//  Created by Jordan Jones on 4/27/19.
//  Copyright © 2019 Jordan Jones. All rights reserved.
//

import Foundation

class RequestCaller {
    
    static let baseURL:String = "http://192.168.1.14:8080/on-the-house"
    
    static func callBackend(uri: String) -> Data? {
        let aURL: URL? = URL(string: "\(baseURL)\(uri)")
        
        let data: Data? = try? Data(contentsOf: aURL!)
        
        return data;
        
    }
    
    
}


