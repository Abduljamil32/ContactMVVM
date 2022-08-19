//
//  CreateScreen.swift
//  ContactMVVM


import SwiftUI

struct CreateScreen: View {
    
    @Environment(\.presentationMode) var presentation
    @ObservedObject var viewmodel = CreateViewModel()
    
    @State var name1 = ""
    @State var phone1 = ""
    
    
    var body: some View {
        VStack{
            TextField("Enter a name...", text: $name1)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.leading, 10).padding(.trailing, 10)
            TextField("Enter a phone number...", text: $phone1)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.leading, 10).padding(.trailing, 10)
                .padding(.bottom, 20)
            Button(action: {
                viewmodel.apiCreatePost(post: Contact(name: name1, phone: phone1))
                self.presentation.wrappedValue.dismiss()
            }, label: {
                Spacer()
                Text("Create").foregroundColor(.white)
                Spacer()
            }).frame(width: 180, height: 50).background(.blue)
        }
    }
}

struct CreateScreen_Previews: PreviewProvider {
    static var previews: some View {
        CreateScreen()
    }
}
