//
//  CustomeTabbarView.swift
//  AdsVizs
//
//  Created by Siya Yang on 2020-07-17.
//  Copyright © 2020 AdsVizs. All rights reserved.
//

import SwiftUI

struct Tabbar: View {
    @Binding var selected : String
    
    var body : some View{
        
        HStack{
            
            ForEach(tabs,id: \.self){i in
                
                VStack(spacing: 10){
                    
                    Capsule()
                        .fill(Color.clear)
                        .frame(height: 5)
                        .overlay(
                            Capsule().fill(self.selected == i ? Color(.clear) : Color.clear).frame(width: 55, height: 5)
                    )
                    
                    Button(action: {
                        
                        self.selected = i
                        
                    }) {
                        
                        VStack{
                            Image(i).renderingMode(.template).foregroundColor(self.selected == i ? Color(.black) : Color(.gray))
                            Text(i).foregroundColor(self.selected == i ? Color(.black) : Color(.gray)).font(.system(size: 14))
                        }
                    }
                }
            }
            
        }.padding(.horizontal)
    }
}

struct Tabbar_Previews: PreviewProvider {
    static var previews: some View {
        Tabbar(selected: Binding.constant("Home"))
    }
}


var tabs = ["Home","Stores","Orders", "Account"]
