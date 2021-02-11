//
//  CardDIsh.swift
//  AdsVizs-backup
//
//  Created by Siya Yang on 2020-08-13.
//  Copyright © 2020 Siya Yang. All rights reserved.
//

import SwiftUI

struct CardDIsh: View {
    var combo : DishCombo
    var store : Store
    @State var show = false
    var body: some View {
        ZStack{
            NavigationLink(destination: ViewDishView(toStoreDetail: self.$show, store: store, combo: combo), isActive: self.$show) {
                Text("")
            }
            
            
            ZStack{
                Image(combo.comboImg)
                Rectangle()
                    .frame(width: 335, height: 134)
                    .foregroundColor(.black).opacity(0.4)
                VStack{
                    
                    HStack{
                        Text(combo.validDate)
                            .foregroundColor(.white)
                            .font(.system(size: 12))
                        
                        Spacer()
                    }
                    Spacer()
                    
                    Text(combo.name)
                        .foregroundColor(.white)
                        .font(.system(size: 28))
                        .bold()
                    
                    Spacer()
                    
                    HStack{
                        Image("icon_data")
                            .resizable()
                            .frame(width: 10, height: 12)
                        Text("26 orders placed")
                            .foregroundColor(.white)
                            .font(.system(size: 12))
                        
                        Spacer()
                        
                        Text("$\(combo.price, specifier: "%.2f")")
                            .foregroundColor(.white)
                            .font(.system(size: 12))
                    }
                }.padding(10)
            }.frame(width:UIScreen.main.bounds.width-38, height: 135).onTapGesture {
                print("tapped toStoreDetail")
                self.show.toggle()
            }
        }
        
        
    }
}

struct CardDIsh_Previews: PreviewProvider {
    static var previews: some View {
        CardDIsh(combo: DishCombo.init(comboImg: "dish1", name: "Single meanl", validDate: "01/02/2020", desc: "sth", price: 12.99, dish: ["dd","ss","ss"]), store: Store.init(name: "ll", img: "sw", distance: "ss", address: "ss", dishCombos: [DishCombo.init(comboImg: "dish2", name: "dd", validDate: "dd", desc: "ss", price: 99.99, dish: ["dd","dd"])]))
    }
}
