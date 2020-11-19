//
//  Root.swift
//  TaxiViewer
//
//  Created by Mustafa Yousef on 19.11.20.
//

import Foundation

struct Root: Decodable {
    
    let stations: [Stations]?
    
    enum CodingKeys: String, CodingKey {
        case stations = "stations"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        stations = try values.decodeIfPresent([Stations].self, forKey: .stations)
    }

}
