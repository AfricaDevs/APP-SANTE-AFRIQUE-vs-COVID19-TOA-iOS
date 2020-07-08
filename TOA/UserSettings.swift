//
//  UserSettings.swift
//  TOA
//
//  Created by Steven on 7/8/20.
//  Copyright © 2020 Coolectif TOA. All rights reserved.
//

import Foundation
class UserSettings: ObservableObject {
    //true for default , false for Bigger
    @Published var textSize : Bool =
        UserDefaults.standard.bool(forKey: "textSize") 
    
}
