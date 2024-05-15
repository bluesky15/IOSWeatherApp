//
//  ContentView.swift
//  WeatherApp
//
//  Created by LALIT KUMAR BEHERA on 13/05/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    
    @State var weather:ResponseBody?
    
    
    var body: some View {
        VStack {
            if let location = locationManager.location{
                if let weather = weather{
                    Text("weather is fetched!")
                }else{
                    LoadingView().task {
                        do{
                            weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            
                        }catch{
                            print("Error getting weather \(error)")
                        }
                    }
                }
                
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView().environmentObject(locationManager)
                        .background(Color(red: 0.0, green: 0.0, blue: 1.0, opacity: 1.0))
                        .preferredColorScheme(.dark)
                }
            }
        }
        .frame(maxWidth:.infinity, maxHeight: .infinity)
    }
}

#Preview {
    ContentView()
}
