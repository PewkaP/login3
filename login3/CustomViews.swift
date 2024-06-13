//
//  CustomViews.swift
//  Login
//
//  Created by student on 22.05.2024.
//

import SwiftUI




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
    @Binding var selection: Int32?
    var options: FetchedResults<Cities>
    
    var body: some View{
        HStack{
            
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height:20)
                .padding(.leading, 20)
            
            Picker(placeHolder, selection: $selection) {
                Text("Wybierz miasto")
                    .tag(nil as Int32?)
                ForEach(options, id: \.self) { city in
                    Text(city.city ?? "")
                        .tag(city.idcity as Int32?)
                }
            }
            .labelsHidden()
            .padding(.leading,12)
            .font(.system(size:20))
            .frame(height: 45)
            
        }
        .overlay(Divider()
                    .overlay(bColor.opacity(tOpacity))
                    .padding(.horizontal,20), alignment: .bottom)
    }
}
