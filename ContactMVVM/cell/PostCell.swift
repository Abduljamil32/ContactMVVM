//
//  PostCell.swift
//  ContactMVVM


import SwiftUI

struct PostCell: View {
    
    var contact: Contact
    
    var body: some View {
        VStack(alignment: .leading){
            Text(contact.name!.uppercased()).fontWeight(.bold)
            Text(contact.phone!).padding(.top, 5)
        }.padding()
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(contact: Contact())
    }
}
