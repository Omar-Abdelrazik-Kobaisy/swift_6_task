//
//  Result.swift
//  swift_6_task
//
//  Created by Omar on 05/02/2023.
//

import Foundation

class Item : Decodable{
    var id : String?
    var rank : String?
    var title : String?
    var image : String?
    var weekend : String?
    var gross : String?
    var weeks : String?
}

class Result : Decodable{
    var items : [Item]
    var errorMessage : String?
}
