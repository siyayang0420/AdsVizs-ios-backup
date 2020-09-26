//
//  StoreListViewCopy.swift
//  AdsVizs-backup
//
//  Created by Siya Yang on 2020-09-20.
//  Copyright © 2020 Siya Yang. All rights reserved.
//

import SwiftUI
import SlidingTabView



struct StoreListView: View {
    @State private var selectedTabIndex = 0
    
    var body: some View {
            VStack(alignment: .leading) {
                TabViewClone(selection: self.$selectedTabIndex, tabs: ["Foodie", "Others"],activeAccentColor: .black,selectionBarColor: .black)
//                (selectedTabIndex == 0 ? FoodieTab() : OthersTab())
                    
                if selectedTabIndex == 0 {
                    FoodieTab().padding()
                } else {
                    OthersTab().padding()
                }
                Spacer()
            }
            .animation(.none)
        }
}

struct StoreListView_Previews: PreviewProvider {
    static var previews: some View {
        StoreListView()
    }
}
