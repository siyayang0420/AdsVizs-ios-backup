//
//  StoreDetailView.swift
//  AdsVizs-backup
//
//  Created by Siya Yang on 2020-08-13.
//  Copyright © 2020 Siya Yang. All rights reserved.
//

import SwiftUI

struct toolTip : View {
    
    var body: some View{
        Text("Test")
    }
    
}

struct StoreDetailView: View {
    @Binding var toStoreList : Bool
    @State private var showToolTip = false
    var store: Store
    var body: some View {
        VStack{
            //top
            ZStack{
                Image(store.img)
                    .resizable()
                    .frame(height: UIScreen.main.bounds.height / 2.5)
                    .edgesIgnoringSafeArea(.top)
                    .overlay(
                        Image("gradient_t2b")
                            .resizable()
                            .frame(height: UIScreen.main.bounds.height / 2.5)
                            .edgesIgnoringSafeArea(.top)
                            .overlay(
                                
                                VStack(alignment: .leading){
                                    HStack{
                                        Button(action: {
                                            // go back to store list
                                            print("to store list", self.toStoreList)
                                            self.toStoreList.toggle()
                                        }){
                                            Image(systemName: "chevron.left")
                                                .resizable()
                                                .frame(width: 15, height: 25)
                                                .foregroundColor(.white)
                                                .padding(.top,100)
                                        }
                                        Spacer()
                                    }
                                    Spacer(minLength: 150)
                                    HStack{
                                        Button(action: {
                                            self.showToolTip.toggle()
                                            print("tool tip")
                                        }){
                                            if showToolTip {
                                                ZStack{
                                                    Image("graph_tooltip")
                                                        .offset(x:33, y:-40)
                                                     
                                                    
                                                    Image("icon_kiosk")
                                                        .renderingMode(.template)
                                                        .resizable()
                                                        .frame(width:25, height: 30)
                                                        .foregroundColor(.white)
                                                        .offset(x:-30)
                                                    
                                                }.frame(width: 100, height: 100).animation(.easeIn)
                                                
                                                
                                                
                                            } else {
                                                Image("icon_kiosk")
                                                    .renderingMode(.template)
                                                    .resizable()
                                                    .frame(width:25, height: 30)
                                                    .foregroundColor(.white)
                                                    .frame(width: 100, height: 100)
                                                    .offset(x:-30)
                                            }
                                            
                                        }.buttonStyle(PlainButtonStyle())
                                        
                                        Spacer()
                                        
                                        Button(action: {
                                            //make phone call
                                            UIApplication.shared.open(URL(string: "tel:7786863033")!)
                                        }){
                                            Image(systemName: "phone.fill")
                                            .resizable()
                                            .frame(width:25, height: 30)
                                            .foregroundColor(.white)
                                            .padding(.trailing)
                                        }
                                    }
                                    
                                    Spacer()
                                    
                                }.padding(.leading)
                                
                        )
                )
                
            }
            
            Spacer(minLength: 60)
            
            //Mid
            VStack(alignment: .leading){
                HStack{
                    Text(store.name)
                        .font(.system(size: 30))
                        .bold()
                    
                    Spacer()
                    
                    Text("3.4km")
                }
                
                Text(store.address)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .padding(.top,8)
                
                HStack{
                    ZStack{
                        Rectangle()
                            .frame(width:100, height: 30)
                            .foregroundColor(Color("bh-open"))
                            .cornerRadius(6)
                        Text("Open Now")
                            .foregroundColor(.white)
                    }
                    
                    Text("Mon - Sun: 11am - 10pm")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                
                Button(action: {
                    //go to delivery
                    UIApplication.shared.open(URL(string: "https://order.kabueats.ca/#/shopNew?id=311")!)
                }){
                    ZStack{
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width - 30, height: 46)
                            .cornerRadius(6)
                            .foregroundColor(.black)
                        
                        Text("Food Delivery")
                            .font(.system(size: 16))
                            .bold()
                            .foregroundColor(.white)
                    }
                }
                
            }.padding(.horizontal)
                .offset(y:-30)
                .frame(height:130)
            
            //coupon list
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 20){
                    ForEach(store.dishCombos){comboItem in
                        CardDIsh(combo: comboItem, store: store)
                    }
                }.padding(.top)
                
            }.onAppear(){
                if self.toStoreList as AnyObject === false as AnyObject {
                    self.toStoreList.toggle()
                    print(" to store list \(self.toStoreList)")
                }
            }
            
            Spacer()
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea(.all)
        
        
        
        
        
    }
    
}





struct StoreDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StoreDetailView(toStoreList: Binding.constant(true), store: Store.init(name: "Futian Dumpling", img: "dumpling", distance: "3.4km", address: "123 main st Vancouver", dishCombos: [DishCombo.init(comboImg: "dish2", name: "Single Meal", validDate: "01/01/2020", desc: "dfs", price: 12.99, dish: ["ss","ss","ss"])]) )
    }
}
