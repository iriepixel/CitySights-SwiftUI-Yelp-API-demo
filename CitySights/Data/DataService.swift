//
//  DataService.swift
//  CitySights
//
//  Created by Jev Smolnikov on 24/05/2024.
//

import Foundation
import CoreLocation

struct DataService {
	
	let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
	
	func businessSearch(userLocation: CLLocationCoordinate2D?, query: String?, options: String?, category: String?) async -> [Business] {
		
		// Check API key exists
		guard apiKey != nil else {
			return [Business]()
		}
		
		// Default lat long
		var lat = 37.785834
		var long = -122.406417
						
		// User lat long
		if let userLocation = userLocation {
			lat = userLocation.latitude
			long = userLocation.longitude
		}
		
		print(category ?? "nil")
		
		var endpointUrlString = "https://api.yelp.com/v3/businesses/search?latitude=\(lat)&longitude=\(long)&limit=30"
		
		// Add query
		if query != nil && query != "" {
			endpointUrlString.append("&term=\(query!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)")
		}
		
		// Add options
		if options != nil && options != "" {
			endpointUrlString.append("&attributes=\(options!)")
		}
		
		// Add category
		if category != nil {
			endpointUrlString.append("&categories=\(category!)")
		}
		
		// Create URL
		if let url = URL(string: endpointUrlString) {
			
			// Create request
			var request = URLRequest(url: url)
			request.addValue("Bearer \(apiKey!)", forHTTPHeaderField: "Authorization")
			request.addValue("application/json", forHTTPHeaderField: "accept")
			
			// Send request
			do {
				let (data, _) = try await URLSession.shared.data(for: request)
				
				// Parse JSON
				let decoder = JSONDecoder()
				let result = try decoder.decode(BusinessSearch.self, from: data)
				
				return result.businesses
				
			} catch {
				print("Send request error: \(error)")
			}
			
		}
		
		return [Business]()
	}
}
