//
//  CountryCases.swift
//  TOA
//
//  Created by Steven on 7/6/20.
//  Copyright © 2020 Coolectif TOA. All rights reserved.
//

import Foundation

struct CountryCases : Codable {
    var confirmed : CasesSubItem
    var recovered : CasesSubItem
    var deaths : CasesSubItem
    var lastUpdate : String = "None"
    
}
 

struct CasesSubItem : Codable {
    var value : Int
    var detail : String = "noURL"
}
