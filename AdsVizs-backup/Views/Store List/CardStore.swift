//
//  CardStore.swift
//  AdsVizs-backup
//
//  Created by Siya Yang on 2020-08-13.
//  Copyright © 2020 Siya Yang. All rights reserved.
//
import SwiftUI

struct CardStore: View {
    
    @State var show = false
    var store : Store
    @State var storeLogo = "futianlogo"
    
    var body: some View {
        ZStack{
            NavigationLink(destination: StoreDetailView(toStoreList: self.$show,store: store
            ), isActive: self.$show) {
                Text("")
            }
            
                ZStack{
                    Image(store.img)
                        //order matters
                        .resizable()
                        .frame(width:UIScreen.main.bounds.width-30, height: 166)
                        .cornerRadius(6)
                        .aspectRatio(contentMode: .fill)
                    
                    //gradient
                    Image("gradient_b2t")
                        .resizable()
                        .frame(width:UIScreen.main.bounds.width-30, height: 166)
                        .cornerRadius(6)
                        .aspectRatio(contentMode: .fill)
                    
                    
                    HStack(alignment: .bottom){
                        
                        StoreLogo(logo: storeLogo)
                        
                        
                        VStack(alignment: .leading){
                            Text(store.name)
                                .font(.system(size: 16))
                                .bold()
                                .foregroundColor(.white)
                            
                            HStack{
                                Text("Open")
                                    .foregroundColor(Color("bh-open"))
                                Text("Mon: until 10pm")
                                    .font(.system(size: 14))
                                    .foregroundColor(.white)
                                
                            }
                        }
                        
                        Spacer()
                        
                        Text(store.distance)
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                    }.offset(y:50)
                        .padding()
                        .frame(width:UIScreen.main.bounds.width-30, height: 166)
                    
                }.padding(.bottom).onTapGesture {
                    self.show.toggle()
                    print("to store info \(self.show)")
                }
            
        }
        
    }
}

struct CardStore_Previews: PreviewProvider {
    static var previews: some View {
        CardStore(store: Store.init(name: "Dumpling", img: "dumpling", distance: "22", address: "address", dishCombos: [DishCombo.init(comboImg: "dish1", name: "single meal", validDate: "09/20/2020", desc: "sth in here", price: 12.99, dish: ["dish_cucumber","dish_dumpling","dish_coke"])]))
    }
}

