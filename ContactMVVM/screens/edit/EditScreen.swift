//
//  EditScreen.swift
//  ContactMVVM
//
//  Created by Avaz Mukhitdinov on 18/08/22.
//

import SwiftUI

struct EditScreen: View {
    
    @Environment(\.presentationMode) var presentation
    @ObservedObject var viewmodel = EditViewModel()
    
    @State var name2 = ""
    @State var phone2 = ""
    
    var post: Contact
    
    func updatePost() {
        let post = Contact(id: post.id!, name: name2, phone: phone2)
        viewmodel.apiPostUpdate(post: post, handler: { isUpdated in
            if isUpdated {
                presentation.wrappedValue.dismiss()
            }
        })
    }
    
    var body: some View {
        VStack{
            TextField("Enter a new name...", text: $name2)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.leading, 10).padding(.trailing, 10)
            TextField("Enter a new phone numer...", text: $phone2)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.leading, 10).padding(.trailing, 10)
                .padding(.bottom, 20)
            Button(action: {
                updatePost()
                
            }, label: {
                Spacer()
                Text("Edit").foregroundColor(.white)
                Spacer()
            }).frame(width: 180, height: 50).background(.blue)
        }.onAppear{
            name2 = post.name!
            phone2 = post.phone!
        }
    }
}

struct EditScreen_Previews: PreviewProvider {
    static var previews: some View {
        EditScreen(post: Contact())
    }
}
