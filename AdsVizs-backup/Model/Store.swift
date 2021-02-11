//
//  BusinessModal.swift
//  AdsVizs
//
//  Created by Siya Yang on 2020-06-19.
//  Copyright © 2020 AdsVizs. All rights reserved.
//

import SwiftUI

struct Store: Codable,Identifiable {
    var id = UUID()
    var name : String
    var img : String
    var distance : String
//    var latitude : Double
//    var longtitude : Double
    var address : String
//    var phone : String
    var dishCombos : [DishCombo]
}

struct DishCombo: Codable, Equatable, Identifiable {
    var id = UUID()
    var comboImg : String
    var name : String
    var validDate : String
    var desc : String
    var price : Double
    var dish : [String]
}


