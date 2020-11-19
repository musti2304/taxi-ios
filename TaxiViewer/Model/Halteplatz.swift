//
//  Halteplatz.swift
//  TaxiViewer
//
//  Created by Mustafa Yousef on 17.11.20.
//

import Foundation

struct Response:Decodable {
    let response:Stations
}

struct Stations:Decodable {
    let stations:[Halteplatz]
}

struct Halteplatz:Decodable {
    let name:String
    let data:Data?
}

struct Data:Decodable {
    let auftraege:Int?
    let einstiege:Int?
    let wartezeit:String?
}
