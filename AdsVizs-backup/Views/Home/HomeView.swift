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
                    
                    VStack{
                        
                        GeometryReader{g in
                            // Using GeomtryReader For Getting Remaining Height...
                            Carousel(width: UIScreen.main.bounds.width, page: self.$page, height: 300).frame(width: UIScreen.main.bounds.width, height: 300)
                            
                            Image("gradient_t2b_home_banner")
                                .aspectRatio(contentMode: .fit)
                                .edgesIgnoringSafeArea(.top)
                            
                        }.frame(width: UIScreen.main.bounds.width, height: 300)
                        
                        PageControl(page: self.$page)
                            .padding(.top,-1)
                    }
                    
                    //greeding + avatar
                    
                    HStack{
                        Text("Hi, My friend")
                            .bold()
                            .foregroundColor(.white)
                            .font(.system(size: 24))
                        
                        Spacer()
                        
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .foregroundColor(.gray)
                            .background(Color.white)
                            .clipShape(Circle())
                            .frame(width:35, height: 35)
                            .shadow(color: Color.black.opacity(0.2), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                    }.padding(.horizontal).offset(x:0, y:-110)
                    
                    
                    
                }
                
            }
            //promo title
            HStack{
                Text("Popular")
                    .fontWeight(.medium)
                    .font(.title)
                Spacer()
            }.padding(.horizontal)
            
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 20){
                    ForEach(self.store){storeItem in
//                        ForEach(self.store.dish){ comboItem in
                            CardCombo(store: storeItem)
//                        }
                    }
                }
            }.padding(.horizontal)
            
            //discover
            HStack{
                Text("Discover")
                    .fontWeight(.medium)
                    .font(.title)
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
