//
//  HomeView.swift
//  AdsVizs-backup
//
//  Created by Siya Yang on 2020-08-28.
//  Copyright © 2020 Siya Yang. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @State var menu = 0
    @State var page = 0
    let store = Bundle.main.decode([Store].self, from: "storeData.json")
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack{
                //top
                ZStack{
                    
                    ZStack{
                        VStack{
                            
                            GeometryReader{g in
                                // Using GeomtryReader For Getting Remaining Height...
                                Carousel(width: UIScreen.main.bounds.width, page: self.$page, height: 200)
                            }.frame(width: UIScreen.main.bounds.width, height: 200)
                            
                            PageControl(page: self.$page)
                                .padding(.top, -25)
                        }
                        
                        
                        //greeding + avatar
                        
                        HStack{
                            Text("Welcome, user.name")
                                .bold()
                                .font(.system(size: 24))
                            
                            Spacer()
                            
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .foregroundColor(.gray)
                                .background(Color.white)
                                .clipShape(Circle())
                                .frame(width:35, height: 35)
                        }.padding(.horizontal).offset(x:0, y:-100)
                        
                        
                    }
                }
                
                
                
                //promo title
                HStack{
                    Image("icon_promo")
                    Text("Feature")
                    Spacer()
                }.padding(.top).padding(.horizontal)
                
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 20){
                        ForEach(self.store){storeItem in
                            //                            ForEach(Store.dishCombos){ comboItem in
                            CardCombo(store: storeItem)
                            //                            }
                        }
                    }
                }.padding(.horizontal)
            }
            
            
            //discover
            HStack{
                Image("icon_discover")
                Text("Discover")
                Spacer()
            }.padding(.top).padding(.horizontal)
            
            //store list
            ForEach(self.store){store in
                CardStore(store: store)
            }
            
            
            Spacer()
        }.edgesIgnoringSafeArea(.top)
    }
    
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
