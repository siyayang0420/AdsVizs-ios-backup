//
//  BannerList.swift
//  AdsVizs-backup
//
//  Created by Siya Yang on 2020-08-28.
//  Copyright © 2020 Siya Yang. All rights reserved.
//

import SwiftUI

struct BannerList: View {
    @Binding var page : Int
    var body: some View {
        HStack(spacing: 0){
            
            ForEach(data){i in
                // Mistakenly Used Geomtry Reader...
                
                Banner(page: self.$page, width: UIScreen.main.bounds.width, data: i)
            }
        }
    }
}

struct BannerList_Previews: PreviewProvider {
    static var previews: some View {
        BannerList(page: Binding.constant(1))
    }
}
