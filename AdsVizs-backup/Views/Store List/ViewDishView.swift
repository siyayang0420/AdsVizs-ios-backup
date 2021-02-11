//
//  ViewDishView.swift
//  AdsVizs-backup
//
//  Created by Siya Yang on 2020-08-14.
//  Copyright © 2020 Siya Yang. All rights reserved.
//
import SwiftUI

enum ActiveAlert {
    case showQuality, showReserve
}

struct ViewDishView: View {
    @State var selectedQ = 0
    @Binding var toStoreDetail : Bool
    @State var price : Double = 13.99
    @State private var showAlert = false
    @State private var activeAlert: ActiveAlert = .showQuality
    @State private var toMyOrderView: Bool = false
    var store : Store
    var combo : DishCombo
    var body: some View {
        VStack{
            //navigate to myorderlist
            NavigationLink(destination: ContentView(selected: "Orders"), isActive: $toMyOrderView,label: { EmptyView() })
            
            VStack{
                //Top
                ZStack{
                    Image(combo.comboImg)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.5)
                        
                        .edgesIgnoringSafeArea(.top)
                        .overlay(
                            Image("gradient_t2b")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width, height: 300)
                                .edgesIgnoringSafeArea(.top)
                        ).padding(.bottom,50)
                    
                    VStack(alignment: .leading){
                        HStack{
                            Button(action: {
                                // go back to store list
                                print("to store detail \(self.toStoreDetail)")
                                self.toStoreDetail.toggle()
                                
                            }){
                                Image(systemName: "chevron.left")
                                    .resizable()
                                    .frame(width: 15, height: 25)
                                    .foregroundColor(.white)
                            }
                            Spacer()
                        }.frame(width: UIScreen.main.bounds.width)
                        .padding(.top,60)
                        .padding(.leading,26)
                        
                        Spacer()
                    }.frame(height: 350)
                }
                
                //Mid
                ScrollView{
                    
                    VStack(alignment: .leading){
                        
                        VStack(alignment: .leading){
                            
                            HStack{
                                StoreLogo(logo: "futianlogo")
                                Text(store.name)
                                    .font(.system(size: 18))
                                    .bold()
                                    .padding(.leading)
                                
                                Spacer()
                                
                                Text("3.4km")
                            }
                            
                            Text(store.address)
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                            Spacer()
                        }
                        
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
                        
                        
                        HStack{
                            Text("$\(price,specifier: "%.2f")")
                                .font(.system(size: 30))
                                .bold()
                            
                            Spacer()
                            
                            Text("Expired : \(combo.validDate)")
                                .font(.system(size: 12))
                        }.padding(.top)
                        
                        Text(combo.name)
                            .font(.system(size: 18))
                            .padding(.top)
                        
                        
                        Text(combo.desc)
                            .font(.system(size: 14))
                            .padding(.top,8)
                            //instead of wrap in ...
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Text("Quality")
                            .font(.system(size: 18))
                            .padding(.top)
                        
                        
                        //select quality
                        QualityBox(selectedQ: self.$selectedQ)
                        
                        Text("Gallery")
                            .font(.system(size: 18))
                            .padding(.top)
                        
                        //gallery
                        DishScrollView(combo: combo)
                        
                        
                        //Add to cart button
                        //in the scrollview, in order to make back btn work it has to be in the "top" layer
                        Button(action: {
                            //add to cart,show reserveAlert
                            if self.selectedQ == 0 {
                                self.activeAlert = .showQuality
                            } else if self.selectedQ > 0 {
                                self.activeAlert = .showReserve
                            }
                            self.showAlert = true
                        }){
                            ZStack{
                                Rectangle()
                                    .frame(width: UIScreen.main.bounds.width - 30, height: 46)
                                    .cornerRadius(6)
                                    .foregroundColor(.white)
                                    .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: 0)
                                    .overlay(
                                        HStack{
                                            Text("10 left")
                                                .foregroundColor(.black)
                                                .padding(.leading,50)
                                            
                                            Spacer()
                                            
                                            ZStack{
                                                
                                                Rectangle()
                                                    .foregroundColor(.black)
                                                    .frame(width: UIScreen.main.bounds.width/2-15)
                                                    .cornerRadius(6)
                                                
                                                Text("Reserve")
                                                    .foregroundColor(.white)
                                            }
                                        }
                                    )
                            }.padding(.bottom,30)
                        }
                        .alert(isPresented: $showAlert) {
                            switch activeAlert {
                            case .showQuality:
                                return Alert(title: Text("Select a quality"), message: Text("Please select at least one"))
                            case .showReserve:
                                return Alert(title: Text("Success!"), message: Text("Added to your order, start using it"),primaryButton: .default(Text("OK")) {
                                    
                                    
                                    //add to the database and jump to MyOrderView
                                    self.addOrder()
                                }, secondaryButton: .cancel(Text("Not ready yet")))
                            }
                            
                            
                        }
                        
                    }.padding(.horizontal).frame(width: UIScreen.main.bounds.width)
                    
                    Spacer()
                }.offset(y:-45)
            }.edgesIgnoringSafeArea(.all)
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    func addOrder() {
        //save order to database
        
        
        //to MyOrderView page
        DispatchQueue.main.async {
            self.toMyOrderView = true
        }
    }
}




struct ViewDishView_Previews: PreviewProvider {
    static var previews: some View {
        ViewDishView(toStoreDetail: Binding.constant(true), store: Store.init(name: "nn", img: "jj", distance: "n", address: "jj", dishCombos: [DishCombo.init(comboImg: "dish1", name: "jj", validDate: "ss", desc: "ss", price: 90.88, dish: ["dd","dd"])]), combo: DishCombo.init(comboImg: "dish1", name: "ds", validDate: "sda", desc: "ds", price: 12.99, dish: ["dd","ss","sds"]))
    }
}
