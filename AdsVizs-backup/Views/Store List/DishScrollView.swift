//
//  DishScrollView.swift
//  AdsVizs-backup
//
//  Created by Siya Yang on 2020-08-14.
//  Copyright © 2020 Siya Yang. All rights reserved.
//

import SwiftUI

struct DishScrollView: View {
    var combo : DishCombo
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 20){
                ForEach(combo.dish, id: \.self){img in
                    Image(img)
                        .shadow(color: Color.black.opacity(0.2), radius: 6, x: 0, y: 0)
                }
            }.frame(height: 170)
            
            
        }
        
    }
}


var imgData = ["dish_dumpling", "dish_cucumber","dish_coke"]

struct DishScrollView_Previews: PreviewProvider {
    static var previews: some View {
        DishScrollView(combo: DishCombo.init(comboImg: "dish1", name: "sth", validDate: "adsa", desc: "dsa", price: 12.99, dish: ["dsa","sda","sad"]))
    }
}
