import SwiftUI
import CoreData

struct SignUpView: View {

    
    // Core Data context
    @Environment(\.managedObjectContext) private var viewContext
    
    // Fetching users and passwords
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \User.iduser, ascending: true)],
        animation: .default)
    private var users: FetchedResults<User>
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Cities.idcity, ascending: true)],
        animation: .default)
    private var cities: FetchedResults<Cities>

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \User_password.iduser_password, ascending: true)],
        animation: .default)
    private var passwords: FetchedResults<User_password>
    
    // State variables
    @State private var animateEllipses = false
    @State private var name: String = ""
    @State private var lastname: String = ""
    @State private var email: String = ""
    @State private var phonenumber: String = ""
    @State private var street: String = ""
    @State private var zipcode: String = ""
    @State private var password: String = ""
    @State private var cpassword: String = ""
    @State private var userID: Int32 = 0
    @State private var cityID: Int32?
    @State private var registrationSuccess = false
    @State private var shouldShowLoginAlert: Bool = false
    

    var body: some View {
        NavigationView {
            ScrollView {
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
                                .padding(.leading,20)
                        }
                        .onAppear {
                            animateEllipses = true
                        }
                
                    
                        VStack(spacing: 30) {
                            VStack {
                                
                                CustomTextField(placeHolder: "Name", imageName: "person.fill", bColor: "textColor2", tOpacity: 1.0, value: $name)
                                CustomTextField(placeHolder: "Lastname", imageName: "person.fill", bColor: "textColor2", tOpacity: 1.0, value: $lastname)
                                CustomTextField(placeHolder: "Email", imageName: "envelope", bColor: "textColor2", tOpacity: 1.0, value: $email)
                                CustomTextField(placeHolder: "Phone number", imageName: "phone.fill", bColor: "textColor2", tOpacity: 1.0, value: $phonenumber)
                                CustomTextField(placeHolder: "Street", imageName: "house.fill", bColor: "textColor2", tOpacity: 1.0, value: $street)
                                CustomTextField(placeHolder: "Zipcode", imageName: "mappin.square.fill", bColor: "textColor2", tOpacity: 1.0, value: $zipcode)
                                CustomPicker(
                                            placeHolder: "Wybierz opcję",
                                            imageName: "arrowtriangle.down.circle",
                                            bColor: Color.gray,
                                            tOpacity: 0.5,
                                            selection: $cityID,
                                            options: cities
                                        )
                                CustomTextField(placeHolder: "Password", imageName: "lock", bColor: "textColor2", tOpacity: 1.0, value: $password)
                                CustomTextField(placeHolder: "Confirm Password", imageName: "lock", bColor: "textColor2", tOpacity: 1.0, value: $cpassword)
                            }
                        
                            CustomButton(title: "SIGN UP", bgColor: "color1")
                                .onTapGesture {
                                    Register()
                                }
                                .navigationDestination(isPresented: $registrationSuccess){
                                    LogginedView(userID: $userID)
                                }
                                .alert(isPresented: $shouldShowLoginAlert){
                                    Alert(title: Text("Sorry, something went wrong..."))
                                }
                        }
                    }
                }
            }
        }
    }
    


    
    // Register user
    private func Register() {
        shouldShowLoginAlert = false
        
        // Check if user already exists
        if (users.first(where: { $0.email == email }) != nil) {
            shouldShowLoginAlert = true
            print("user exist")
            return
        }
        
        // Check if passwords match
        if password != cpassword {
            print("passwords incorrect")
            shouldShowLoginAlert = true
            return
        }
        
        // Create new user
        var newUser = User(context: viewContext)
        userID = Int32(users.count+1)
        newUser.iduser = userID
        newUser.name = name
        newUser.lastname = lastname
        newUser.email = email
        newUser.fk_iduser_type = 1
        newUser.phonenumber = Int64(phonenumber)!
        newUser.street = street
        newUser.zipcode = zipcode
        newUser.fk_idcity = cityID!
        newUser.fk_idloyal_card = Int32(users.count+1)
        print("user: \(newUser.iduser) \(String(describing: newUser.name)) \(String(describing: newUser.lastname)) \(String(describing: newUser.email)) \(newUser.phonenumber) \(String(describing: newUser.street)) \(String(describing: newUser.zipcode)) \(newUser.fk_idloyal_card) ")
        // Save user
        do {
            print("creating user")
            try viewContext.save()
        } catch {
            print("creating user fail")
            shouldShowLoginAlert = true
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        
        // Create new password
        var newPass = User_password(context: viewContext)
        newPass.iduser_password = Int32(passwords.count+1)
        newPass.fk_iduser = newUser.iduser
        newPass.password_hashed = password
        newPass.password_changed_date = Date()
        newPass.password_valid = true
        print("password: \(newPass.iduser_password) \(newPass.fk_iduser) \(String(describing: newPass.password_hashed)) \(String(describing: newPass.password_changed_date)) \(newPass.password_valid) ")
        // Save password
        do {
            print("creating password")
            try viewContext.save()
        } catch {
            print("creating password fail")
            shouldShowLoginAlert = true
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        print("everything should be fine")
        registrationSuccess=true
    }
}


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
