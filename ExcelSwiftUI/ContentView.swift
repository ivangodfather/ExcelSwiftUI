//
//  ContentView.swift
//  ExcelSwiftUI
//
//  Created by Ivan Ruiz Monjo on 25/03/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//



import SwiftUI

struct ContentView: View {
    
    let data =  [
        [Text("") , Text("Monday").bold(), Text("Twesday").bold(), Text("Wednesday").bold()],
        [Text("Mallorca").bold(), Text("Cloudy") , Text("Sunny"), Text("Sunny")],
        [Text("Barcelona").bold(), Text("Very Sunny") , Text("Sunny"), Text("Rainy")]
    ]
    
    var body: some View {
        TableView(data: data)
            .font(.system(size: 16, weight: .regular, design: .monospaced))

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
