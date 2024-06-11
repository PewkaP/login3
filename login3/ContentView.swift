//
//  ContentView.swift
//  login3
//
//  Created by Piotr Plewka on 04/06/2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
     @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \User.iduser,ascending: true)],animation: .default)
     private var users: FetchedResults<User>

     @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath:\User_password.iduser_password, ascending: true)],animation: .default)
     private var passwords: FetchedResults<User_password>
    
    var body: some View {
        
        //LoginView()
        NavigationStack{
            NavigationLink("LoginView", destination: LoginView())
            Text("")
            Text("")
            NavigationLink("SignupView", destination: SignUpView())
        }.onAppear{
            if(users.count==0){
                addUsers()
            }
            if(passwords.count==0){
                addPasswords()
            }
        }
        
    }
    private func addPasswords(){
        var newPass = User_password(context: viewContext)
        newPass.iduser_password=1
        newPass.fk_iduser=1
        newPass.password_hashed="QWerTY"
        newPass.password_changed_date=Date(timeIntervalSince1970: 1606633600.0)
        newPass.password_valid=true
        
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    
        newPass = User_password(context: viewContext)
        newPass.iduser_password=2
        newPass.fk_iduser=2
        newPass.password_hashed="iyvwbciusoicbiw"
        newPass.password_changed_date=Date(timeIntervalSince1970: 1506533600.0)
        newPass.password_valid=false
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        newPass = User_password(context: viewContext)
        newPass.iduser_password=3
        newPass.fk_iduser=2
        newPass.password_hashed="wiuebccef"
        newPass.password_changed_date=Date(timeIntervalSince1970: 1506933600.0)
        newPass.password_valid=true
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        newPass = User_password(context: viewContext)
        newPass.iduser_password=4
        newPass.fk_iduser=3
        newPass.password_hashed="dwoubcansxi"
        newPass.password_changed_date=Date(timeIntervalSince1970: 1306933600.0)
        newPass.password_valid=true
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    private func addUsers(){
        var newUser = User(context: viewContext)
        newUser.iduser=1
        newUser.name="Adam"
        newUser.lastname="Nowak"
        newUser.email="a.nowak@gmail.com"
        newUser.fk_iduser_type=1
        newUser.phonenumber=111222333
        newUser.street="ulica a"
        newUser.zipcode="12-345"
        newUser.fk_idcity=1
        newUser.fk_idloyal_card=1
        
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    
        newUser = User(context: viewContext)
        newUser.iduser=2
        newUser.name="Jan"
        newUser.lastname="Kowalski"
        newUser.email="j.kowalski@gmail.com"
        newUser.fk_iduser_type=1
        newUser.phonenumber=222333444
        newUser.street="ulica b"
        newUser.zipcode="12-987"
        newUser.fk_idcity=1
        newUser.fk_idloyal_card=2
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        newUser = User(context: viewContext)
        newUser.iduser=3
        newUser.name="Anna"
        newUser.lastname="Przykładowa"
        newUser.email="a.przykładowa@gmail.com"
        newUser.fk_iduser_type=1
        newUser.phonenumber=999888777
        newUser.street="ulica c"
        newUser.zipcode="21-345"
        newUser.fk_idcity=2
        newUser.fk_idloyal_card=3
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
     
    }

}

