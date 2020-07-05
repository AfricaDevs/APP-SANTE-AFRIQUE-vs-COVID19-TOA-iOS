//
//  Prevention.swift
//  TOA
//
//  Created by Steven on 7/5/20.
//  Copyright © 2020 Coolectif TOA. All rights reserved.
//

import UIKit
import CoreLocation
import Foundation
 
let preventionOptionArray: [Prevention] = load( fileName: "PreventionOptionsArray.json")
 
func load<T: Decodable> ( fileName: String, as type: T.Type = T.self) -> T{
    let JSONData: Data
    
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil)
        else {
            fatalError("impossible de trouver le fichier \(fileName) dans le Bundle principal.")
        }
    
    do {
        JSONData = try Data(contentsOf: file)
    } catch {
        fatalError("impossible de charger \(fileName) du Bundle principal:\n \(error)")
    }
    
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: JSONData)
    } catch {
        fatalError("impossible de lire \(fileName) en tant que \(T.self):\n\(error)")
    }
} 
