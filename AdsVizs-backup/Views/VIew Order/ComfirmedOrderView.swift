//
//  ConfirmedOrderView.swift
//  AdsVizs-backup
//
//  Created by Siya Yang on 2020-08-13.
//  Copyright © 2020 Siya Yang. All rights reserved.
//

import SwiftUI

struct ConfirmedOrderView: View {
    @State private var q : Int = 2
    @State private var price : Double = 13.99
    @State private var statusTxt = "Waiting for acceptance"
    @State private var statusColor = "status-red"
    @State private var showShowAlert = false
    
    
    
    var body: some View {
        
        VStack{
                
                //Store Image
                Image("dumpling")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350, height: 200)
            
            
            
            VStack(alignment: .leading){
               //Location
                VStack(alignment: .leading){
                    Text("Futian Dumpling Restaurant")
                    .font(.system(size: 18))
                    .bold()
                    
                    
                    Text("3490 Kingsway #7, Vancouver, BC V5R 5L7")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                }.padding()
                
                
                
                OrderDetail(q: q, price: price)
                Spacer()
            }
            
            
            
            Button(action: {
                self.showShowAlert = true
                
            }){
                ZStack{
                    Rectangle()
                        .foregroundColor(.black)
                        .frame(width: UIScreen.main.bounds.width - 30, height: 56)
                        .cornerRadius(6)
                    
                    Text("Use this coupon")
                        .foregroundColor(.white)
                        .bold()
                }
            }.alert(isPresented:$showShowAlert) {
                Alert(title: Text("Show to the resturant"), message: Text("Show this to the resturant when using it, if the order is accepted we will inform you"), primaryButton: .destructive(Text("I already did")) {
                    //cancel code
                    }, secondaryButton: .cancel(Text("Later")){
                        
                    })
            }
                
                
            }.navigationBarTitle("View Order",displayMode: .inline)
        
        
    }
}

struct ConfirmedOrderView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ConfirmedOrderView()
        }
    }
}
