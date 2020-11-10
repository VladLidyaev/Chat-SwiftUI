//
//  IDData.swift
//  reapp
//
//  Created by Vlad on 02.10.2020.
//  Copyright © 2020 Vlad. All rights reserved.
//

import SwiftUI


struct iDData : Identifiable {
    var id: String
    var name : String
    var msg : String
    @State var image : Data
}
