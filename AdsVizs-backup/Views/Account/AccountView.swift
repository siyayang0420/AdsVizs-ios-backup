//
//  AccoutViews.swift
//  AdsVizs
//
//  Created by Siya Yang on 2020-06-19.
//  Copyright © 2020 AdsVizs. All rights reserved.
//

import SwiftUI

struct AccountView: View {
    @State private var isToggle : Bool = false
    @State private var name = ""
    @State private var phone = ""
    @State var showingImagePicker = false
    @State var image: Image? = nil
    @State var showingTerms = false
    @State var isNavigationBarHidden: Bool = true
    
    var body: some View {

        NavigationView{
            VStack(alignment: .leading, spacing: 30){
                        
                        ZStack{
                            Image("account_banner")
                                .edgesIgnoringSafeArea(.top)
                            Image("account_gradient")
                            
                            VStack(alignment: .center){
                                //change the profile image
                                ZStack(alignment: .bottomTrailing){
                                    if image == nil {
                                        Image(systemName: "person.crop.circle.fill")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 60, height: 60)
                                            .foregroundColor(.gray)
                                    } else {
                                        image?
                                            .resizable()
                                            .clipShape(Circle())
                                            .frame(width: 60, height: 60)
                                            .aspectRatio(contentMode: .fill)
                                    }
                                    
                                    
                                    
                                }.padding()
                                    
                                    .overlay(
                                        
                                        //image picker button
                                        Button(action: {
                                            self.showingImagePicker.toggle()
                                        }){
                                            ZStack{
                                                Rectangle()
                                                    .foregroundColor(.clear)
                                                Image(systemName: "pencil.circle.fill")
                                                    .frame(width: 20, height: 20)
                                                    .foregroundColor(.black)
                                                    .background(Color.white)
                                                    .clipShape(Circle())
                                            }.frame(width:100, height: 90)
                                            
                                        }.offset(x:26,y:20))
                                
                                Text("Emily")
                                    .font(.title)
                                    .padding(.bottom)
                                Text("778-123-1234")
                                    .font(.body)
                                
                            }
                            .frame(width: UIScreen.main.bounds.width, height: 238, alignment: .center)
                            .shadow(color: Color.black.opacity(0.05),radius: 6, x: 0, y: 6)
                        } .sheet(isPresented: $showingTerms, content: {
                            ScrollView(showsIndicators: false){
                                VStack{
                                    Image("logo")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 150, height: 150)
                                    VStack(alignment: .leading){
                                        Text("Privacy Statement")
                                            .font(.headline)
                                            .bold()
                                        Text(ps)
                                            .padding(.vertical)
                                        
                                        
                                        Text("Use of Personal Information")
                                            .font(.headline)
                                            .bold()
                                        Text(pi)
                                            .padding(.vertical)
                                        
                                        Text("Disclaimer")
                                            .font(.headline)
                                            .bold()
                                            .padding(.bottom)
                                        Text(d1)
                                            .padding(.bottom)
                                        Text(d2)
                                            .padding(.bottom)
                                        Text(d3)
                                            .padding(.vertical)
                                    }.padding()
                                }.padding()
                            }
                        })
                        
                        //setting and terms
                        VStack(alignment: .leading, spacing: 20){
                            
                           
                            NavigationLink(destination: EditAccountView(isNavigationBarHidden: self.$isNavigationBarHidden)){
                                VStack(alignment: .leading){
                                    Text("Edit profile")
                                        .foregroundColor(.black)
                                    
                                    Rectangle()
                                        .foregroundColor(.gray)
                                        .opacity(0.3)
                                        .frame(width: UIScreen.main.bounds.width-30, height: 1)
                                }
                            }
                                
                                
                                    
                                
                            
                            
                            //Navigate to term of service
                            VStack(alignment: .leading){
                                Button(action: {
                                    self.showingTerms.toggle()
                                }){
                                    Text("Terms of Service")
                                        .foregroundColor(.black)
                                }
                                
                                
                                
                                Rectangle()
                                    .foregroundColor(.gray)
                                    .opacity(0.3)
                                    .frame(width: UIScreen.main.bounds.width - 30, height: 1)
                            }
                            
                            
                            
                            
                            
                            Button(action:{
                                // log out func
                            }){
                                Text("Log Out")
                                    .foregroundColor(.red)
                            }
                            
                            Spacer()
                        }.frame(width: UIScreen.main.bounds.width)
                            .padding(.horizontal, 30)
                            //toggle photo library
                            .sheet(isPresented: $showingImagePicker, content: {
                                ImagePicker.shared.view
                            }).onReceive(ImagePicker.shared.$image){image in
                                self.image = image
                        }
                        
                    }
                    .frame(width: UIScreen.main.bounds.width)
            
//                    .navigationBarTitle("")
//                    .navigationBarHidden(true)
                    .navigationBarTitle("")
                    .navigationBarHidden(self.isNavigationBarHidden)
            .onAppear {
                self.isNavigationBarHidden = true
            }
        }
        
            

            }
        
    }
    
    
    struct AccouutView_Previews: PreviewProvider {
        static var previews: some View {
            AccountView()
        }
    }



var ps = "We respect the privacy of every individual who visits our website. We take great measures to ensure the privacy and confidentiality of any personal information on this site."

var pi = "All personal information supplied will remain within our organization and will not be shared with any external entity unless prior permission is given. Your personal information will not be sold, distributed or published in any manner whatsoever."

var d1 = "AdsVizs does not give any warranty or other assurance as to the operation, quality or functionality of the site. Access to the site may be interrupted, restricted or delayed for any reason."

var d2 = "AdsVizs also does not give any warranty or other assurance as to the content of the material appearing on the site, its accuracy, completeness, timelessness or fitness for any particular purpose."

var d3 = "To the full extent permissible by law, AdsVizs disclaims all responsibility for any damages or losses (including, without limitation, financial loss, damages for loss in business projects, loss of profits or other consequential losses) arising in contract, tort or otherwise from the use of or inability to use the Site or any material appearing on AdsVizs, or from any action or decision taken as a result of using AdsVizs or any such material. AdsVizs contains links to external sites. AdsVizs is not responsible for and has no control over the content of such sites. Information on AdsVizs, or available via hypertext link from AdsVizs, is made available without responsibility on the part of AdsVizs. AdsVizs disclaims all responsibility and liability (including for negligence) in relation to information on or accessible from AdsVizs."
