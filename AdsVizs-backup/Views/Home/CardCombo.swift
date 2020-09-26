//
//  CardCombo.swift
//  AdsVizs-backup
//
//  Created by Siya Yang on 2020-08-28.
//  Copyright © 2020 Siya Yang. All rights reserved.
//

import SwiftUI

struct CardCombo: View {
    @State var show = false
    var store : Store
//    var combo : DishCombo
    var body: some View {
        
        ZStack{
            NavigationLink(destination: StoreDetailView(toStoreList: self.$show,store: store
            ), isActive: self.$show) {
                Text("")
            }
            
            ZStack{
                Image(store.img)
                    .resizable()
                    .frame(width: 250, height: 200)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(15)
                    .overlay(
                        Rectangle()
                            .opacity(0.2)
                )
                VStack(alignment: .leading){
                    Spacer()
                    
                    HStack{
                        Text(store.name)
                            .bold()
                        
                        Spacer()
                        
                        Text("10 left")
                    }
                    
                    HStack{
//                        Text("$\(combo.price, specifier: "%.2f")")
//                            .bold()
//                        Text("$\(combo.price, specifier: "%.2f")")
//                            .strikethrough()
                    }
                }.foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.bottom)
                
            }
            .frame(width: 250, height: 200)
            .cornerRadius(15)
            .onTapGesture {
                self.show.toggle()
                print("to store info \(self.show)")
            }
            
            
        }
        
    }
}

struct CardCombo_Previews: PreviewProvider {
    static var previews: some View {
        CardCombo(store: Store.init(name: "ss", img: "ss", distance: "12", address: "ds", dishCombos: [DishCombo.init(comboImg: "dish1", name: "ss", validDate: "ss", desc: "ss", price: 12.3, dish: ["ss","ss"])])
//                  , combo: DishCombo.init(comboImg: "dish2", name: "dd", validDate: "dd", desc: "dd", price: 99.99, dish: ["dd","ss"])
        )
    }
}
