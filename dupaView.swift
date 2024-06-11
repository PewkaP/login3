//
//  dupaView.swift
//  login3
//
//  Created by Piotr Plewka on 11/06/2024.
//

import SwiftUI

struct dupaView: View {
  @State private var email: String = "root"
  @State private var password: String = "toor"
  
  @State private var isLoginValid: Bool = false
  @State private var shouldShowLoginAlert: Bool = false
    @State private var id: Int32 = 2
  var body: some View {
    NavigationView {
      VStack(alignment: .center) {
        TextField("email", text: self.$email)
        TextField("password", text: self.$password)
        
        NavigationLink(destination: LogginedView(userID: $id),
                       isActive: self.$isLoginValid) {
                /*
                 Here we put the content view of `NavigationLink`.
                 It could be any `View` even `Button` but in this
                 example we use a `Text` with `onTapGesture`.
                 */
            CustomButton(title: "LOG IN", bgColor: "color1")
                    .onTapGesture {
                    //determine login validity
                    let isLoginValid = self.email == "root" && self.password == "toor"
                    
                    //trigger logic
                    if isLoginValid {
                      self.isLoginValid = true //trigger NavigationLink
                    }
                    else {
                      self.shouldShowLoginAlert = true //trigger Alert
                    }
                }
        }
      }
      .navigationBarTitle("Login Screen")
      .alert(isPresented: $shouldShowLoginAlert) {
        Alert(title: Text("Email/Password incorrect"))
      }
    }
  }
}

#Preview {
    dupaView()
}
