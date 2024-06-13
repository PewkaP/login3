//
//  CustomViews.swift
//  Login
//
//  Created by student on 22.05.2024.
//

import SwiftUI



#Preview {
//    CustomTextField(placeHolder: "lorem", imageName: "person.fill", bColor: "textColor1", tOpacity: 1.0, value: .constant(""))
    kontencik()
    
}
<<<<<<< HEAD

=======
struct ContencikView: View {
    @State private var selectedOption = ""
    let options = ["Option 1", "Option 2", "Option 3"]
    
    var body: some View {
        VStack {
    
//            CustomPicker(placeHolder: "Select an option", imageName: "list.bullet", bColor: "gray", tOpacity: 1.0, selection: $selectedOption, options: options)
            CustomTextField(placeHolder: "Name", imageName: "person", bColor: "gray", tOpacity: 1.0, value: $selectedOption)
        }
        .padding()
    }
}
>>>>>>> origin/main
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




struct CustomPicker: View {
    
    var placeHolder: String
    var imageName: String
    var bColor: Color
    var tOpacity: Double
    @Binding var selection: String
    var options: [String]
    
    var body: some View{
        HStack{
            
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height:20)
                .padding(.leading, 20)
            
            Picker(selection: $selection, label: Text(placeHolder).foregroundColor(selection.isEmpty ? .gray : .primary)) {
                ForEach(options, id: \.self) { option in
                    Text(option).tag(option)
                }
            }
            .font(.system(size: 20))
            .padding(.leading,12)
            .frame(height: 45)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(bColor.opacity(tOpacity), lineWidth: 1)
            )
            .padding(.horizontal,20)
        }
    }
}

struct kontencik: View {
    
    @State private var selectedOption = ""
    let options = ["Opcja 1", "Opcja 2", "Opcja 3"]
    
    var body: some View {
        CustomPicker(
            placeHolder: "Wybierz opcję",
            imageName: "arrowtriangle.down.circle",
            bColor: Color.gray,
            tOpacity: 0.5,
            selection: $selectedOption,
            options: options
        )
    }
}
