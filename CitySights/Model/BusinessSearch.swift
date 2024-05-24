//
//  BusinessSearch.swift
//  CitySights
//
//  Created by Jev Smolnikov on 24/05/2024.
//

import Foundation

struct BusinessSearch: Decodable {
	var businesses = [Business]()
	var region = Region()
	var total = 0
}

struct Region: Decodable {
	var center: Coodinate?
}

struct Coodinate: Decodable {
	var longitude: Double?
	var latitude: Double?
}
