//
//  Cell.swift
//  SantanderTesteiOS
//
//  Created by Diego Costa on 23/09/18.
//  Copyright © 2018 Diego Costa. All rights reserved.
//

import Foundation

struct Cell : Codable {
    var id          : Int?
    var type        : Int?
    var message     : String?
    var typeField   : Int?
    var hidden      : Bool?
    var topSpacing  : Double?
    var show        : Int?
    var required    : Bool?
}
