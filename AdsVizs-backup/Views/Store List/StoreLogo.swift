//
//  StoreLogo.swift
//  AdsVizs-backup
//
//  Created by Siya Yang on 2020-08-13.
//  Copyright © 2020 Siya Yang. All rights reserved.
//

import SwiftUI

struct StoreLogo: View {
    @State var logo : String
    
    var body: some View {
        
        ZStack{
            Rectangle()
                .frame(width: 40, height: 37)
                .foregroundColor(.white)
            .cornerRadius(5)
            
            Image(logo)
        }
        
    }
}

struct StoreLogo_Previews: PreviewProvider {
    static var previews: some View {
        StoreLogo(logo: "futianlogo")
        .shadow(radius: 3)
    }
}
