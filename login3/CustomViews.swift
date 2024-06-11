//
//  CustomViews.swift
//  Login
//
//  Created by student on 22.05.2024.
//

import SwiftUI



#Preview {
    CustomTextField(placeHolder: "lorem", imageName: "person.fill", bColor: "textColor1", tOpacity: 1.0, value: .constant(""))
    
}
struct ContencikView: View {
    @State private var selectedOption = ""
    let options = ["Option 1", "Option 2", "Option 3"]
    
    var body: some View {
        VStack {
            
            CustomPicker(placeHolder: "Select an option", imageName: "list.bullet", bColor: "gray", tOpacity: 1.0, selection: $selectedOption, options: options)
            CustomTextField(placeHolder: "Name", imageName: "person", bColor: "gray", tOpacity: 1.0, value: $selectedOption)
        }
        .padding()
    }
}
struct CustomTextField: View {
    
    var placeHolder: String
    var imageName: String
    var bColor: String
    var tOpacity: Double
    @Binding var value: String
    
    var body: some View{
        HStack{
            
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height:20)
                .padding(.leading, 20)
            
            if placeHolder == "Password" || placeHolder == "Confirm Password"{
                ZStack(alignment: .leading){
                    if value.isEmpty{
                        Text(placeHolder)
                            .padding(.leading,12)
                            .font(.system(size: 20))
                    }
                    SecureField("", text: $value)
                        .padding(.leading,12)
                        .font(.system(size:20))
                        .frame(height: 45)
                }
            }
            
            else {
                ZStack(alignment: .leading) {
                    if value.isEmpty{
                        Text(placeHolder)
                            .padding(.leading,12)
                            .font(.system(size: 20))
                    }
                    TextField("",text: $value)
                        .padding(.leading,12)
                        .font(.system(size:20))
                        .frame(height: 45)
                }
            }
        }
        .overlay(Divider()
                    .overlay(Color(bColor).opacity(tOpacity))
                    .padding(.horizontal,20), alignment: .bottom)
    }
}

struct CustomButton: View {
    var title: String
    var bgColor: String
    var body: some View {
        Text(title)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(height: 58)
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color(bgColor))
            .cornerRadius(15)
        
    }
}

