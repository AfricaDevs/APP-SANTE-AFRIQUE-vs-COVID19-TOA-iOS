//
//  Prevention.swift
//  TOA
//
//  Created by Steven on 7/5/20.
//  Copyright © 2020 Coolectif TOA. All rights reserved.
//

import SwiftUI

struct Prevention: Identifiable, Decodable{

    var id : Int //UUID()
    var title : String
    var lottieFileName: String
    
    var getTitle : String {return title}
    var getLottieFileName : String {return lottieFileName}

}
 
