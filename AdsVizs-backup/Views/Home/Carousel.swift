//
//  Carousel.swift
//  AdsVizs-backup
//
//  Created by Siya Yang on 2020-08-28.
//  Copyright © 2020 Siya Yang. All rights reserved.
//


import SwiftUI

struct Carousel : UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        return Carousel.Coordinator(parent1: self)
    }
    
    var width : CGFloat
    @Binding var page : Int
    var height : CGFloat
    
    func makeUIView(context: Context) -> UIScrollView{
        
        // ScrollView Content Size...
        
        let total = width * CGFloat(data.count)
        let view = UIScrollView()
        view.isPagingEnabled = true
        //1.0  For Disabling Vertical Scroll....
        view.contentSize = CGSize(width: total, height: 1.0)
        view.bounces = true
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.delegate = context.coordinator
        
        // embed swiftUI View Into UIView...
        
        let view1 = UIHostingController(rootView: BannerList(page: self.$page))
        view1.view.frame = CGRect(x: 0, y: 0, width: total, height: self.height)
        view1.view.backgroundColor = .clear
        
        view.addSubview(view1.view)
        
        return view
        
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
        
    }
    
    class Coordinator : NSObject,UIScrollViewDelegate{
        
        var parent : Carousel
        
        init(parent1: Carousel) {
            
            parent = parent1
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            
            // Using This Function For Getting Currnet Page
            // Follow Me...
            
            let page = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
            
            self.parent.page = page
        }
    }
}


struct Type : Identifiable {
    var id : Int
    var bannerName : String
}

var data = [
    Type(id: 0, bannerName: "select"),
    
    Type(id: 1, bannerName: "dish_dumpling"),
    
    Type(id: 2, bannerName: "select"),
    
    Type(id: 3, bannerName: "banner_sample"),
    
    Type(id: 4, bannerName: "banner_sample")
]




struct Carousel_Previews: PreviewProvider {
    static var previews: some View {
        Carousel(width: UIScreen.main.bounds.width, page: Binding.constant(1), height: 300)
    }
}
