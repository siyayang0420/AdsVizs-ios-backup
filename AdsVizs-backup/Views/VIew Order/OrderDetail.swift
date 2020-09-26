//
//  OrderDetail.swift
//  AdsVizs
//
//  Created by Siya Yang on 2020-07-05.
//  Copyright © 2020 AdsVizs. All rights reserved.
//

import SwiftUI

struct OrderDetail: View {
    @State var q : Int
    @State var price : Double
    
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Order Details")
                .font(.system(size: 18))
                .bold()
                .padding(.horizontal)
            HStack{
                VStack{
                    HStack(alignment: .center){
                        Text("Single Meal")
                            .bold()
                            .font(.system(size: 14))
                        
                        Spacer()
                        
                        Text("Quality: \(q)")
                            .foregroundColor(.gray)
                        
                        
                    }.padding(.horizontal).padding(.top)
                    
                    HStack{
                        Text("16 dumplings 白菜豬肉,  皮蛋豆腐,  雪碧")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Spacer()
                        
                        
                        Text("$\(Double(price)*Double(q), specifier: "%.2f")")
                            .bold()
                    }.padding(.horizontal)
                        .padding(.top,10)
                    
                    
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width-30, height: 1)
                        .foregroundColor(.gray)
                        .opacity(0.2)
                }
                
            }
            
            
        }
        .padding(.vertical)
        .background(Color.white)
        
        
    }
}

struct OrderDetail_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetail(q: 2, price: 16.99)
    }
}
