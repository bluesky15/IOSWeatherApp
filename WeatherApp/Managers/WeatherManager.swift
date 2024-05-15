//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by LALIT KUMAR BEHERA on 15/05/24.
//

import Foundation
import CoreLocation

class WeatherManager{
    func getCurrentWeather(latitude:CLLocationDegrees, longitude:CLLocationDegrees) async throws -> ResponseBody {
        guard let url = URL(string:"https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=6cbd7f76f051189493a62f20f8835bc0&unit=metric") else {fatalError("Missing URL")}
        
        let urlRequest = URLRequest(url:url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error fetching weather data")}
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        return decodedData
    }
}
