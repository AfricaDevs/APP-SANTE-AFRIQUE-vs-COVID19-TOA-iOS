//
//  CountryModel.swift
//  TOA
//
//  Created by Steven on 7/6/20.
//  Copyright © 2020 Coolectif TOA. All rights reserved.
//

import Foundation
import UIKit

struct Country: Identifiable, Decodable , Hashable{
    
    let id : Int//UUID()
    var name : String
    var iso2 : String
    var iso3 : String
    
}
