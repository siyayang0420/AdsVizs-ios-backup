//
//  FoodieTab.swift
//  AdsVizs-backup
//
//  Created by Siya Yang on 2020-09-20.
//  Copyright © 2020 Siya Yang. All rights reserved.
//

import SwiftUI

struct FoodieTab: View {
    let store = Bundle.main.decode([Store].self, from: "storeData.json")
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(){
                ForEach(self.store){ store in
                    CardStore(store: store)
                }
            }
            
        }
    }
}

struct FoodieTab_Previews: PreviewProvider {
    static var previews: some View {
        FoodieTab()
    }
}
