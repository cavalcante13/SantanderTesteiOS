//
//  ScreenInfo.swift
//  SantanderTesteiOS
//
//  Created by Diego Costa on 22/09/18.
//  Copyright © 2018 Diego Costa. All rights reserved.
//

import Foundation


struct Screen : Codable {
    
    var title       : String?
    var fundName    : String?
    var whatIs      : String?
    var definition  : String?
    var riskTitle   : String?
    var risk        : Int = 0
    var infoTitle   : String?
    var moreInfo    : ScreenMoreInfo?
    var info        : [FundInfo] = []
}
