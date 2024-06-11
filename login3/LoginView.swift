

import SwiftUI
import CoreData
struct LoginView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \User.iduser, ascending: true)],
        animation: .default)
    private var users: FetchedResults<User>

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \User_password.iduser_password, ascending: true)],
        animation: .default)
    private var passwords: FetchedResults<User_password>
    
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var animateEllipses = false
    @State private var loginSuccess = false
    @State private var shouldShowLoginAlert: Bool = false

    @State private var userID: Int32 = 0
    var body: some View {
            ZStack(alignment: .topLeading) {
                VStack(spacing: 40) {
                    ZStack {
                        Ellipse()
                            .frame(width: 510, height: 478)
                            .padding(.leading, -200)
                            .foregroundColor(Color("color2"))
                            .padding(.top, -200)
                            .offset(x: animateEllipses ? 0 : UIScreen.main.bounds.width)
                            .animation(.easeOut(duration: 1.0), value: animateEllipses)
                        
                        Ellipse()
                            .frame(width: 458, height: 420)
                            .padding(.trailing, -500)
                            .foregroundColor(Color("color1"))
                            .padding(.top, -200)
                            .offset(x: animateEllipses ? 0 : -UIScreen.main.bounds.width)
                            .animation(.easeOut(duration: 1.0), value: animateEllipses)
                        
                        Text("Welcome \nBack")
                            .foregroundColor(.white)
                            .font(.system(size: 35))
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 20)
                    }
                    NavigationView {
                        VStack(spacing: 30) {
                            VStack(spacing: 30) {
                                CustomTextField(placeHolder: "Email", imageName: "envelope", bColor: "textColor1", tOpacity: 0.6, value: $email)
                                CustomTextField(placeHolder: "Password", imageName: "lock", bColor: "textColor1", tOpacity: 0.6, value: $password)
                            }
                            Text("Forgot Password")
                                .fontWeight(.medium)
                            NavigationLink(destination: LogginedView(userID: $userID), isActive: self.$loginSuccess) {
                                
                                CustomButton(title: "LOG IN", bgColor: "color1")
                                    .onTapGesture {
                                        Login()
                                    }
                            }
                            .navigationBarTitle("Login Screen")
                            .alert(isPresented: $shouldShowLoginAlert) {
                                Alert(title: Text("Email/Password incorrect"))
                            }
                        }
                    }
                }
            }
            .onAppear {
                animateEllipses = true
            }
        }
    
    private func Login(){
        print("started")
        if let user = users.first(where: { $0.email == email }) {
            userID=user.iduser
            if let pass = passwords.first(where: { $0.fk_iduser == userID }) {
                let passtemp = pass
                if passtemp.password_valid==true && passtemp.fk_iduser==userID && passtemp.password_hashed==password{
                    print("success")
                    loginSuccess=true
                    print("\(loginSuccess)")
                }
            }
        }
        if(loginSuccess != true){
            shouldShowLoginAlert = true
        }
        
    }
}
