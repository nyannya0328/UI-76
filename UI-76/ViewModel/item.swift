//
//  item.swift
//  UI-76
//
//  Created by にゃんにゃん丸 on 2020/12/18.
//

import SwiftUI

struct item: Identifiable {
    
    var id = UUID().uuidString
    var name : String
    var image : String
    var age : String
    var offset : CGFloat
    
}

var items = [

    item(name: "Baby", image: "p1", age: "0.3", offset: 0),
    item(name: "Girl", image: "p2", age: "8", offset: 0),
    item(name: "Boy", image: "p3", age: "9", offset: 0),
    item(name: "Moai", image: "p4", age: "???", offset: 0),
    item(name: "Birid", image: "p5", age: "10", offset: 0),
    item(name: "Girl", image: "p6", age: "23", offset: 0),
   

]

