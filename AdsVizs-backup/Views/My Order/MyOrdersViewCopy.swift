//
//  MyOrdersViewCopy.swift
//  AdsVizs-backup
//
//  Created by Siya Yang on 2020-09-20.
//  Copyright © 2020 Siya Yang. All rights reserved.
//

import SwiftUI

struct MyOrdersView: View {
    @State private var selectedTabIndex = 0
    
    var body: some View {
            VStack(alignment: .leading) {
                TabViewClone(selection: self.$selectedTabIndex, tabs: ["In Progress", "History"],activeAccentColor: .black,selectionBarColor: .black)
                    
                if selectedTabIndex == 0 {
                    InProgressTab().padding(.horizontal)
                } else {
                    HistoryTab().padding(.horizontal)
                }
                Spacer()
            }
            .animation(.none)
        }
}

struct MyOrdersViewCopy_Previews: PreviewProvider {
    static var previews: some View {
        MyOrdersView()
    }
}
