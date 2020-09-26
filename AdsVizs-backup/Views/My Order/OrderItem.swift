//
//  OrderItem.swift
//  AdsVizs
//
//  Created by Siya Yang on 2020-07-05.
//  Copyright © 2020 AdsVizs. All rights reserved.
//

import SwiftUI

struct OrderItem: View {
    @State var statusTxt = "Ready to use"
    @State var statusColor = "status-blue"
    var cardWidth = UIScreen.main.bounds.width-30
    var body: some View {
        
        VStack(){
            HStack{
                
                Rectangle()
                    .frame(width:3, height: 170)
                    .cornerRadius(5)
                    .foregroundColor(Color(statusColor))
                
                
                
                VStack(alignment: .leading){
                    //Status
                    Status(txt: self.$statusTxt, color: self.$statusColor)
                    
                    HStack{
                        Text("Futian Restaurant")
                            .font(.headline)
                        
                        Spacer()
                        
                        Text("$16.99")
                            .bold()
                    }.padding(.vertical)
                    
                    
                    
                    Text("Single Meal")
                        .font(.headline)
                    
                    HStack(alignment: .bottom){
                        Text("Pork and cabbage,egg tofu salad,Sprite")
                            .font(.subheadline)
                    }
                }
                
                Spacer()
            }
        }
        .frame(width:cardWidth)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.15),radius: 6)
        .padding(.bottom,10)
        .padding(.top,10)
        .padding(.horizontal)
        
        
        
        
    }
}

struct OrderItem_Previews: PreviewProvider {
    static var previews: some View {
        OrderItem()
    }
}
