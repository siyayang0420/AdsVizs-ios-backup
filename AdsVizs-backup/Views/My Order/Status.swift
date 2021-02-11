//
//  Status.swift
//  AdsVizs
//
//  Created by Siya Yang on 2020-07-07.
//  Copyright © 2020 AdsVizs. All rights reserved.
//

import SwiftUI

struct Status: View {
    @Binding var txt : String
    @Binding var color : String
    
    var body: some View {
        ZStack{
            
            Text(txt)
                .foregroundColor(Color(color))
                .padding(.vertical,7)
                .padding(.horizontal,10)
                .background(Color(color).opacity(0.2))
                .cornerRadius(8)
            
            
        }
    }
}

struct Status_Previews: PreviewProvider {
    static var previews: some View {
        Status(txt: Binding.constant("Waiting for acceptance"), color: Binding.constant("status-red"))
    }
}
