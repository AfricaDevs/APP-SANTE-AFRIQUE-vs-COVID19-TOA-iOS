//
//  DataLoader.swift
//  TOA
//
//  Created by Steven on 7/5/20.
//  Copyright © 2020 Coolectif TOA. All rights reserved.
//

import Foundation

public class DataLoader : ObservableObject {
    
@Published var preventionArray = [Prevention]()
    @Published var countriesArray : Array<Country> = [Country]()
    
           var jsonFileName : String
    
    init(jsonFileName : String!) {
        
        self.jsonFileName = jsonFileName
        
        if jsonFileName == "preventionOptionsArray" {
             loadPrevention()
        } else {
            loadCountries()
        }
    }
    
    func loadPrevention() {
        
        
        if let fileLocation = Bundle.main.url(forResource: "preventionOptionsArray", withExtension: "json")
        {
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                preventionArray = try jsonDecoder.decode([Prevention].self, from: data)
                //preventionArray = try jsonDecoder.decode([Prevention].self, from: data)
            } catch {
                fatalError("impossible de charger preventionOptionsArray du Bundle principal:\n \(error)")
            }
        } else {
            fatalError("impossible de trouver le fichier preventionOptionsArray dans le Bundle principal.\n")
        }
        
    }
    
    func loadCountries() {
        
        
        if let fileLocation = Bundle.main.url(forResource: "countries_list", withExtension: "json")
        {
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                countriesArray = try jsonDecoder.decode([Country].self, from: data)
                //preventionArray = try jsonDecoder.decode([Prevention].self, from: data)
            } catch {
                fatalError("impossible de charger preventionOptionsArray du Bundle principal:\n \(error)")
            }
        } else {
            fatalError("impossible de trouver le fichier preventionOptionsArray dans le Bundle principal.\n")
        }
        
    }
}
