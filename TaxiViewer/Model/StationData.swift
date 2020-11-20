//
//  Data.swift
//  TaxiViewer
//
//  Created by Mustafa Yousef on 19.11.20.
//

import Foundation

struct StationData:Decodable {
    let auftraege:Int?
    let einstiege:Int?
    let wartezeit:String?
    
}
