//
//  ContentView.swift
//  reapp
//
//  Created by Vlad on 29.09.2020.
//  Copyright © 2020 Vlad. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var name : String = ""
    @State var show = false
    @State var image : Data = .init(count: 0)
    
    var ImageSize : CGFloat = 60
    var Radius : CGFloat = 20
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    if self.image.count != 0 {
                        Image(uiImage: UIImage(data: self.image)!)
                            .resizable()
                            .frame(width: ImageSize, height: ImageSize)
                            .clipShape(Circle())
                            .overlay(Circle()
                            .stroke(Color.yellow, lineWidth: 1))
                        .padding(10)
                    } else{
                        Button(action: {
                            self.show.toggle()
                        }) {
                        Image("person")
                            .resizable()
                            .frame(width: ImageSize, height: ImageSize)
                            .clipShape(Circle())
                            .overlay(Circle()
                            .stroke(Color.yellow, lineWidth: 1))
                            .padding(10)
                        }.padding(10)
                        
                    }
                    
                    TextField("Имя пользователя...", text: self.$name)
                        .padding(10)
                        .background(Color(red: 233.0/255, green: 234.0/255, blue: 243.0/255))
                        .cornerRadius(Radius)
                    
                    NavigationLink(destination: Messagepage(name: self.name, image: self.$image)){
                        HStack{
                            Text("Войти")
                                .padding(10)
                                .foregroundColor(.white)
                                .background(self.name.count > 0 ? Color.blue : Color.gray)
                                .cornerRadius(8)
                        }
                    }.padding(20)
                }
                .background(Color.white)
                .cornerRadius(Radius)
//                .shadow(color: .gray, radius: 5, x: 1, y: 1)
                .padding(20)
            }
        }.sheet(isPresented: self.$show, content: {
            ImagePicker(show: self.$show, image: self.$image)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
