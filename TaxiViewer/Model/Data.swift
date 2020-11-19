//
//  Data.swift
//  TaxiViewer
//
//  Created by Mustafa Yousef on 19.11.20.
//

import Foundation

struct Data:Decodable {
    let auftraege:Int?
    let einstiege:Int?
    let wartezeit:String?
    
    enum CodingKeys: String, CodingKey {
        case auftraege = "auftraege"
        case einstiege = "einstiege"
        case wartezeit = "wartezeit"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        auftraege = try values.decodeIfPresent(Int.self, forKey: .auftraege)
        einstiege = try values.decodeIfPresent(Int.self, forKey: .einstiege)
        wartezeit = try values.decodeIfPresent(String.self, forKey: .wartezeit)
    }
}
