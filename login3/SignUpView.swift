//
//  SignUpView.swift
//  Login
//
//  Created by student on 22.05.2024.
//

import SwiftUI

struct SignUpView: View {
    @State private var animateEllipses = false
    @State private var name: String = ""
    @State private var lastname: String = ""
    @State private var email: String = ""
    @State private var phonenumber: String = ""
    @State private var street: String = ""
    @State private var zipcode: String = ""
    @State private var password: String = ""
    @State private var cpassword: String = ""
    var body: some View {
        ScrollView{
                ZStack(alignment: .topLeading){
                    VStack(spacing: 40){
                        ZStack{
                            Ellipse()
                                .frame(width: 510, height: 478)
                                .padding(.leading, -200)
                                .foregroundColor(Color("color2"))
                                .padding(.top,-200)
                                .offset(x: animateEllipses ? 0 : UIScreen.main.bounds.width)
                            //                            .scaleEffect(animateEllipses ? 1 : 0.8)
                            //                            .opacity(animateEllipses ? 1 : 0)
                                .animation(.easeOut(duration: 1.0), value: animateEllipses)
                            
                            Ellipse()
                                .frame(width: 458, height: 420)
                                .padding(.trailing, -500)
                                .foregroundColor(Color("color1"))
                                .padding(.top,-200)
                                .offset(x: animateEllipses ? 0 : -UIScreen.main.bounds.width)
                            //                            .scaleEffect(animateEllipses ? 1 : 0.8)
                            //                            .opacity(animateEllipses ? 1 : 0)
                                .animation(.easeOut(duration: 1.0), value: animateEllipses)
                            
                            
                            Text("Welcome \nBack")
                                .foregroundColor(.white)
                                .font(.system(size: 35))
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading,20)
                        }.onAppear {
                            animateEllipses = true
                        }//ZStack
                        
                        VStack(spacing: 30){
                            VStack(spacing: 30){
                                CustomTextField(placeHolder: "Name", imageName: "person.fill", bColor: "textColor2", tOpacity: 1.0, value: $name)
                                CustomTextField(placeHolder: "Lastname", imageName: "person.fill", bColor: "textColor2", tOpacity: 1.0, value: $lastname)
                                CustomTextField(placeHolder: "Email", imageName: "envelope", bColor: "textColor2", tOpacity: 1.0, value: $email)
                                CustomTextField(placeHolder: "Phone number", imageName: "phone.fill", bColor: "textColor2", tOpacity: 1.0, value: $phonenumber)
                                CustomTextField(placeHolder: "Street", imageName: "house.fill", bColor: "textColor2", tOpacity: 1.0, value: $street)
                                CustomTextField(placeHolder: "Zipcode", imageName: "mappin.square.fill", bColor: "textColor2", tOpacity: 1.0, value: $zipcode)
                                CustomTextField(placeHolder: "Password", imageName: "lock", bColor: "textColor2", tOpacity: 1.0, value: $password)
                                CustomTextField(placeHolder: "Confirm Password", imageName: "lock", bColor: "textColor2", tOpacity: 1.0, value: $cpassword)
                            }//VStack(spacing: 30)
                            
                            VStack{
                                Button(action:{},label:{
                                    CustomButton(title: "SIGN UP", bgColor:"color1")
                                })
                            }.padding(.horizontal,20)//VStack
                        }//VStack(spacing: 30)
                    }//VStack(spacing: 40)
                }//ZStack(alignment: .topLeading)
        }//ScrollView
    }//var body: some View
}//struct SignUpView: View

#Preview {
    SignUpView()
}
//
//NavigationView{
//    ZStack(alignment: .topLeading){
//        Color("color1").ignoresSafeArea()
//        VStack{
//            VStack(spacing: 40){
//                ZStack{
//                    Ellipse()
//                        .frame(width: 458, height: 420)
//                        .padding(.trailing, -500)
//                        .foregroundColor(Color("color2"))
//                        .padding(.top, -200)
//                    Text("Create Account")
//                        .foregroundColor(.white)
//                        .font(.system(size: 35))
//                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                        .multilineTextAlignment(.leading)
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .padding(.leading, 20)
//                        .padding(.top, 100)
//                }
//                VStack (spacing: 30){
//                    VStack (spacing: 30){
//                        CustomTextField(placeHolder:"Email",imageName:"envelope",bColor:"textColor1",tOpacity: 0.6,value:$email)
//                        CustomTextField(placeHolder:"Password",imageName:"lock",bColor:"textColor1",tOpacity: 0.6,value:$password)
//                    }
//                    VStack(alignment: .trailing){
//                        Button(action: {}, label:{
//                            CustomButton(title: "SIGN IN", bgColor: "color1")
//                        })
//                    }.padding(.horizontal, 20)
//                }
//            }
//            Spacer()
//            HStack{
//                Text("Already have an account?")
//                    .fontWeight(.bold)
//                    .foregroundColor(.white)
//                    .font(.system(size: 18))
//                Button(action: {}, label:{
//                    Text("SIGN IN")
//                        .font(.system(size: 18))
//                        .foregroundColor(Color("color1"))
//                        .fontWeight(.bold)
//                })
//            }.frame(height: 63)
//            .frame(minWidth: 0, maxWidth: .infinity)
//            .background(Color("color2"))
//            .ignoresSafeArea()
//        }
//
//    }.edgesIgnoringSafeArea(.bottom)
//}
//
//
