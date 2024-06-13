//
//  LogginedView.swift
//  login
//
//  Created by Piotr Plewka on 04/06/2024.
//

import SwiftUI
import CoreData

struct LogginedView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \User.iduser, ascending: true)],
        animation: .default)
    private var users: FetchedResults<User>

    @State private var angle: Angle = Angle(degrees: 0)
    @Binding var userID: Int32
    @State private var mapSuccess = false
    
    var body: some View {
        VStack{
            if let user = users.first(where: { $0.iduser == userID }) {
                Text("Hello logged in user \(user.email ?? "Unknown")")
                Image("Image\(userID%4+1)")
                    .rotationEffect(angle)
                    .gesture(RotationGesture()
                    .onChanged { angle in
                              self.angle = angle
                    })
                NavigationLink(destination: MapView(street: user.street ?? "", zipcode: user.zipcode ?? "")){
                    CustomButton(title: "Zobacz lokalizacje", bgColor: "color1")
                }
            }
        }
    }
}

//#Preview {
//    LogginedView(userID: .constant(1))
//}
