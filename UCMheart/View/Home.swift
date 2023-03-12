//
//  Home.swift
//  UCMheart
//
//  Created by Andres Felipe Yunda Castillo on 4/12/22.
//

import SwiftUI
import HealthKit

struct Home: View {
    
    private var ecgViewModel: ECGViewModel?
    init() {
        ecgViewModel = ECGViewModel()
    }
    
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            Resultados()
                .tabItem {
                    Label("Resultados", systemImage: "heart.text.square.fill")
                }
        }.padding()
            .onAppear{
                if let ecgViewModel = ecgViewModel{
                    ecgViewModel.requestAuthorization{ success in
                    }
                }
            }
        
    }
   
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
