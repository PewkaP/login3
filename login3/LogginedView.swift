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

    @State private var magnifyBy: CGFloat = 1.0
    @State private var angle: Angle = .zero
    @GestureState private var magnifyTemp: CGFloat = 1.0
    @GestureState private var angleTemp: Angle = .zero
    @Binding var userID: Int32
    @State private var mapSuccess = false
    @State private var gestureFlag=false

    var body: some View {
        VStack{
            if let user = users.first(where: { $0.iduser == userID }) {
                Text("Hello logged in user \(user.email ?? "Unknown")")
                Toggle("Zmień gesture", isOn: $gestureFlag)
                if gestureFlag {
                            Image("Image\(userID % 4 + 1)")
                                .resizable()
                                .scaledToFit()
                                .rotationEffect(angle + angleTemp)
                                .scaleEffect(magnifyBy)
                                .gesture(
                                    RotationGesture()
                                        .updating($angleTemp) { value, state, transaction in
                                            state = value
                                        }
                                        .onEnded { value in
                                            angle += value
                                        }
                                )
                        } else {
                            Image("Image\(userID % 4 + 1)")
                                .resizable()
                                .scaledToFit()
                                .rotationEffect(angle)
                                .scaleEffect(magnifyBy * magnifyTemp)
                                .gesture(
                                    MagnificationGesture()
                                        .updating($magnifyTemp) { value, state, transaction in
                                            state = value
                                        }
                                        .onEnded { value in
                                            magnifyBy *= value
                                        }
                                )
                        }
                
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
