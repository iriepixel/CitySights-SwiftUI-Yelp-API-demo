//
//  Business.swift
//  CitySights
//
//  Created by Jev Smolnikov on 24/05/2024.
//

import Foundation

struct Business: Decodable, Identifiable {
	var id: String?
	var alias: String?
	var name: String?
	var image_url: String?
	var is_closed: Bool?
	var url: String?
	var review_count: Int?
	var categories: [Category]
	var rating: Double?
	var coordinates: Coodinate?
	var location: Location?
	var phone: String?
	var display_phone: String?
	var distance: Double?
	var attributes: Attribute?
	
//	enum CodingKeys: String, CodingKey {
//		case imageUrl = "image_url"
//		case isClosed = "is_closed"
//		case reviewCount = "review_count"
//		case displayPhone = "display_phone"
//		case id
//		case alias
//		case name
//		case url
//		case categories
//		case rating
//		case coordinates
//		case location
//		case phone
//		case distance
//		case attributes
//	}
}

struct Category: Decodable {
	var alias: String?
	var title: String?
}

struct Location: Decodable {
	var address1: String?
	var address2: String?
	var address3: String?
	var city: String?
	var zip_code: String?
	var country: String?
	var state: String?
	var display_address: [String]?
	
//	enum CodingKeys: String, CodingKey {
//		case zipCode = "zip_code"
//		case displayAddress = "display_address"
//		case address1
//		case address2
//		case address3
//		case city
//		case country
//		case state
//	}
}

struct Attribute: Decodable {
	var business_temp_closed: Bool?
	var menu_url: String?
	var open24_hours: Bool?
	var waitlist_reservation: Bool?
	
//	enum CodingKeys: String, CodingKey {
//		case businessTempClosed = "business_temp_closed"
//		case menuUrl = "menu_url"
//		case open24Hours = "open24_hours"
//		case waitlistReservation = "waitlist_reservation"
//	}
}
