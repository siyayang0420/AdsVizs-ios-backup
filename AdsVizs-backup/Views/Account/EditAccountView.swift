//
//  EditAccountView.swift
//  AdsVizs
//
//  Created by Siya Yang on 2020-08-16.
//  Copyright © 2020 AdsVizs. All rights reserved.
//

import SwiftUI

struct EditAccountView: View {
//    @Binding var show : Bool
    @State private var timeRemaining = 5
    @State private var isActive = false
    @State var showTimer = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var name = ""
    @State private var phone = ""
    @State var vCode = ""
    @Binding var isNavigationBarHidden: Bool
    var body: some View {
//        NavigationView{
            VStack{
                HStack{
                    Text("Username")
                    TextField("Name", text: $name)
                }
                Rectangle()
                    .foregroundColor(.gray)
                    .opacity(0.3)
                    .frame(width: UIScreen.main.bounds.width-30, height: 1)
                
                HStack{
                    Text("Phone Number")
                    TextField("Phone No.", text: $phone).keyboardType(.phonePad)
                }
                
                Rectangle()
                    .foregroundColor(.gray)
                    .opacity(0.3)
                    .frame(width: UIScreen.main.bounds.width-30, height: 1)
                
                
                HStack{
                    Button(action: {
                        //send the verification code
                        self.showTimer = true
                        //prevent timer run in the background
                        self.isActive = true
                    }){
                        ZStack{
                            Rectangle()
                                .foregroundColor(self.showTimer ? Color.gray : Color.black)
                                .frame(width: 180, height: 46)
                                .cornerRadius(6)

                            Text(self.showTimer ? "Resend in \(self.timeRemaining)s" : "Get Verification Code")
                                .foregroundColor(.white)
                        }
                    }
                    
                    Spacer()
                    
                    TextField("Enter code", text: $vCode)
                        .keyboardType(.numberPad)
                        .padding(12)
                        .cornerRadius(6)
                        .addBorder(Color.black, cornerRadius: 6)
                    
                    
                    
                }.padding(.vertical)
                
                Text("You may receive an SMS for phone changing verification. Message and data rates may apply.")
                    .foregroundColor(.gray)
                    .font(.system(size: 13))
                 Spacer()
                
            }
            .padding(.top)
            .navigationBarTitle("Edit profile", displayMode: .inline)
            .padding(.horizontal)
            .onReceive(timer) { time in
                    guard self.isActive else { return }
                    if self.timeRemaining > 0 {
                    self.timeRemaining -= 1
                    }
            }
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
                self.isActive = false
            }
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
                self.isActive = true
            }
            .onAppear {
                self.isNavigationBarHidden = false
            }
//    }
        
    }
    
    
}




struct EditAccountView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            EditAccountView(isNavigationBarHidden: Binding.constant(false))
        }
    }
}
