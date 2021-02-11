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
                    InProgressTab()
                } else {
                    HistoryTab()
                }
                Spacer()
            }
            .animation(.none)
            // to remove the top area sapce & hide the back btn
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
}

struct MyOrdersView_Previews: PreviewProvider {
    static var previews: some View {
        MyOrdersView()
    }
}
