//
//  ContentView.swift
//  WeatherApp
//
//  Created by LALIT KUMAR BEHERA on 13/05/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews:PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}
