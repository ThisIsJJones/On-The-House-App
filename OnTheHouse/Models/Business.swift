//
//  Business.swift
//  OnTheHouse
//
//  Created by Jordan Jones on 4/30/19.
//  Copyright © 2019 Jordan Jones. All rights reserved.
//

import Foundation


class Business {
    let businessName:String;
    let longitude:Double;
    let latitude:Double;
    var raffles:[Raffle] = [];
    
    init?(json: [String: Any]) {
        guard let businessName = json["businessName"] as? String,
            let longitude = json["longitude"] as? Double,
            let latitude = json["latitude"] as? Double
            else {
                return nil
        }
        
        if let allRaffles = json["raffles"] as? [Any] {
            if let raffle = allRaffles.first as? [String : Any]{
                // access individual object in array
                print(raffle)
                let raffleObj:Raffle = Raffle(json: raffle)!;
                self.raffles.append(raffleObj);
            }else{
                print("Failed on first array");
            }
        }else{
            print("Failed on array of raffles");
        }
        
        self.businessName = businessName
        self.longitude = longitude
        self.latitude = latitude
        
    }
}
