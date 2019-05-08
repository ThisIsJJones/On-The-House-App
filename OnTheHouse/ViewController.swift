//
//  ViewController.swift
//  OnTheHouse
//
//  Created by Jordan Jones on 4/16/19.
//  Copyright © 2019 Jordan Jones. All rights reserved.
//

import UIKit

class HomePage: UIViewController {

    var businesses:[Business] = [];
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let locationURI:String = "/raffle/getLocalBusinesses/-91.509523/44.802995/";
        
        let data:Data? = RequestCaller.callBackend(uri:locationURI);
        
        let json = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
        print(json as! [Any])
        
        if let allBusinesses = json as? [Any] {
            if let business = allBusinesses.first as? [String : Any]{
                // access individual object in array
                let businessObj:Business = Business(json: business)!;
                businesses.append(businessObj);
            }else{
                 print("Failed on first array");
            }
        }else{
            print("Failed on array of businesses");
        }
        
//        var business:Business = try! JSONSerialization.jsonObject(with: allBusiness, options: .allowFragments) as! Business
        
        
    }


}

extension HomePage: UITableViewDataSource, UITableViewDelegate {
    // Define no of rows in your tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return businesses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Default cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")! as UITableViewCell
        
        cell.textLabel!.text = "\(businesses[indexPath.row].raffles[0].id)"
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Go to raffle information
    }
    
}

