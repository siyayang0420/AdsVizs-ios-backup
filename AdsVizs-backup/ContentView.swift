//
//  ContentView.swift
//  AdsVizs
//
//  Created by Siya Yang on 2020-06-14.
//  Copyright © 2020 AdsVizs. All rights reserved.


import SwiftUI

struct ContentView: View {
    @State var selected = "Home"
//    let store : Store
    var body: some View {
        NavigationView{
            VStack{
                
                if self.selected == "Home"{
                    HomeView()
                }
                else if self.selected == "Stores"{
                    
                    GeometryReader{_ in
                        
                       StoreListView()
                    }
                }
                else if self.selected == "Orders"{
                        
                        GeometryReader{_ in
                            
                           MyOrdersView()
                        }
                    }
                else {
                    GeometryReader{_ in
                        
                        AccountView()
                    }
                }
                
                Tabbar(selected: $selected)
            }
            //remove initial home page top space
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        //remove home page top space when jump from order page
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(selected: "Home")
    }
}



