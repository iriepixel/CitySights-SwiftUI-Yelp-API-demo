//
//  TextHelper.swift
//  CitySights
//
//  Created by Jev Smolnikov on 25/05/2024.
//

import Foundation

struct TextHelper {
	
	static func roundRating(rating: Double) -> Double{
	   return (rating * 2).rounded() / 2
	}
	
	static func distanceAwayText(meters: Double) -> String {
		if meters > 1000 {
			return "\(Int(round(meters / 1000))) km away"
		} else {
			return "\(Int(round(meters))) meters away"
		}
	}
}
