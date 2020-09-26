//
//  InProgressTab.swift
//  AdsVizs-backup
//
//  Created by Siya Yang on 2020-09-20.
//  Copyright © 2020 Siya Yang. All rights reserved.
//

import SwiftUI

struct InProgressTab: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(){
                VStack(spacing:0){
                    ForEach(0 ..< 3 ){ _ in
                        OrderItem()
                    }
                }
            } .padding(.bottom,90)
            
        }
//            .padding(.top,10)
    }
}

struct InProgressTab_Previews: PreviewProvider {
    static var previews: some View {
        InProgressTab()
    }
}
