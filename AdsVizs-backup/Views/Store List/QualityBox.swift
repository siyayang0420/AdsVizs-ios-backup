//
//  QualityBox.swift
//  AdsVizs-backup
//
//  Created by Siya Yang on 2020-08-14.
//  Copyright © 2020 Siya Yang. All rights reserved.
//

import SwiftUI

struct QualityBox: View {
    @Binding var selectedQ : Int
    var body: some View {
        HStack{
            ForEach (qData, id:\.self){ q in
                Button(action: {
                    self.selectedQ = q
                    print(q)
                }){
                    ZStack{
                        Rectangle()
                            .cornerRadius(5)
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 10, x: 0, y: 0).opacity(0.1)
                            .frame(width: 45, height: 45)
                            .addBorder(
                                self.selectedQ == q ? Color.black : Color.white,width: 2, cornerRadius: 5)
                        
                        
                        Text("\(q)")
                            .foregroundColor(.black)
                    }
                }
            }
            
            
        }
        
        
    }
}

var qData=[1,2,3,4]

extension View {
    public func addBorder<S>(_ content: S, width: CGFloat = 1, cornerRadius: CGFloat) -> some View where S : ShapeStyle {
        return overlay(RoundedRectangle(cornerRadius: cornerRadius).strokeBorder(content, lineWidth: width))
    }
}
struct QualityBox_Previews: PreviewProvider {
    static var previews: some View {
        QualityBox(selectedQ: Binding.constant(0))
    }
}
