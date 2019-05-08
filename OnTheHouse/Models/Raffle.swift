//
//  Raffle.swift
//  OnTheHouse
//
//  Created by Jordan Jones on 4/30/19.
//  Copyright © 2019 Jordan Jones. All rights reserved.
//

import Foundation

class Raffle {
    
    
    let id: Int;
    let startDate: Date;
    let startTime: Date;
    let endTime: Date;
    
    init?(json: [String: Any]) {
        
        
        guard let id = json["id"] as? Int,
            let startDate = json["startDate"] as? Date,
            let startTime = json["startTime"] as? Date,
            let endTime = json["endTime"] as? Date
            else {
                return nil
        }
        
        self.id = id;
        self.startDate = startDate;
        self.startTime = startTime;
        self.endTime = endTime;
    }
}
