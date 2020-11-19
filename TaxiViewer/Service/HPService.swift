//
//  HPService.swift
//  TaxiViewer
//
//  Created by Mustafa Yousef on 16.11.20.
//

import Foundation
import Alamofire

class HPService {
    
    var hpDelegate: HPDelegate?
    var infoDelegate: InfoDelegate?
    static let services = HPService()
    
    func fetchHalteplaetze() {
        
        AF.request("https://taxi-api-de.herokuapp.com/api/v1/halteplaetze").response { response in
            
            let data = String(data: response.data!, encoding: .utf8)
            
            self.hpDelegate?.updateHalteplaetze(stationsNewArray: data!)
        }
        
    }
    
    func fetchInformation() {
        
        AF.request("https://taxi-api-de.herokuapp.com/api/v1/users").response { response in
            
            let data = String(data: response.data!, encoding: .utf8)
            
            self.infoDelegate?.updateInformation(infoNewArray: data!)
            
        }
    }
    
}
