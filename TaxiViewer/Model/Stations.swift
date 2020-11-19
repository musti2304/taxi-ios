//
//  Stations.swift
//  TaxiViewer
//
//  Created by Mustafa Yousef on 19.11.20.
//

import Foundation

struct Stations:Decodable {
    let name:String?
    let data:[Data]?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: CodingKeys.self)
        name = try? values?.decodeIfPresent(String.self, forKey: .name)
        data = try? values?.decodeIfPresent([Data].self, forKey: .data)
    }
    
}
