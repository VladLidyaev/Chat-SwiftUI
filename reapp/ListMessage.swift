//
//  ListMessage.swift
//  reapp
//
//  Created by Vlad on 02.10.2020.
//  Copyright © 2020 Vlad. All rights reserved.
//

import SwiftUI


struct ListMessage : View {
    
    var msg = ""
    
    var Message = false
    var user = ""
    var images = ["1","2","3","4","5","6"]
    @State var random = Int.random(in: 1...6)
    
    @Binding var image : Data 
    
    var body: some View {
         
        HStack {
            if Message {
                Spacer()
                
                HStack {
                Text(msg).padding(10).background(Color.secondary)
                .cornerRadius(18)
                    .foregroundColor(.white)
                    
                    Image(uiImage: UIImage(data: self.image) ?? UIImage(imageLiteralResourceName: images[random])).resizable()
                        .frame(width: 45, height: 45)
                    .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                }
            } else {
                HStack {
                    Image(uiImage: UIImage(data: self.image) ?? UIImage(imageLiteralResourceName: images[random])).resizable()
                        .frame(width: 45, height: 45)
                    .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))

                    Text(msg).padding(10).background(Color.blue)
                    .cornerRadius(28)
                        .foregroundColor(.white)

                }
                Spacer()
            }
        }
    }
}
