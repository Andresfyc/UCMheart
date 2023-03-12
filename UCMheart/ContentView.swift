//
//  ContentView.swift
//  UCMheart
//
//  Created by Andres Felipe Yunda Castillo on 25/10/22.
//

import SwiftUI

struct ContentView: View {
    //@StateObject var viewModel = ECGViewModel()
    var body: some View {
        VStack {
            Image(systemName: "person.and.background.dotted")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("UCM")
        }
        .padding()
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
