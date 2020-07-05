//
//  DataLoader.swift
//  TOA
//
//  Created by Steven on 7/5/20.
//  Copyright © 2020 Coolectif TOA. All rights reserved.
//

import Foundation

public class DataLoader {
@Published var preventionArray = [Prevention]()

init() {
    load()
}
func load() {
    
    
    if let fileLocation = Bundle.main.url(forResource: "preventionOptionsArray", withExtension: "json")
    {
        do {
            let data = try Data(contentsOf: fileLocation)
            let jsonDecoder = JSONDecoder()
            preventionArray = try jsonDecoder.decode([Prevention].self, from: data)
        } catch {
            fatalError("impossible de charger preventionOptionsArray du Bundle principal:\n \(error)")
        }
    } else {
        fatalError("impossible de trouver le fichier preventionOptionsArray dans le Bundle principal.\n")
    }
    
}
}
