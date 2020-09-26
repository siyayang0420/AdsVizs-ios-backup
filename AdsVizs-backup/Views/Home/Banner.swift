//
//  Banner.swift
//  AdsVizs-backup
//
//  Created by Siya Yang on 2020-08-28.
//  Copyright © 2020 Siya Yang. All rights reserved.
//

import SwiftUI

struct Banner: View {
    @Binding var page : Int
    var width : CGFloat
    var data : Type
    
    
    
    var body: some View {
        VStack{
            
            VStack{
                
                Image(self.data.bannerName)
                
                // For Filling Empty Space....
            }
            .padding(.vertical, self.page == data.id ? 0 : 25)
            .padding(.horizontal, self.page == data.id ? 0 : 25)
            
            // Increasing Height And Width If Currnet Page Appears...
        }
        .frame(width: self.width)
//        .animation(.default)
    }
}

struct Banner_Previews: PreviewProvider {
    static var previews: some View {
        Banner(page: Binding.constant(1), width: 800, data: Type.init(id: 123, bannerName: "banner_sample"))
    }
}
