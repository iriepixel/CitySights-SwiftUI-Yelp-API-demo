//
//  MapView.swift
//  CitySights
//
//  Created by Jev Smolnikov on 28/05/2024.
//

import SwiftUI
import MapKit

struct MapView: View {
	
	@Environment(BusinessModel.self) var model
	@State var selectedBusinessId: String?
	
    var body: some View {
		Map(selection: $selectedBusinessId) {
			ForEach(model.businesses, id: \.id) {b in
				Marker(b.name ?? "Restaraunt",
					   coordinate: CLLocationCoordinate2D(
							latitude: b.coordinates?.latitude ?? 0,
							longitude: b.coordinates?.longitude ?? 0
					   )
				)
				.tag(b.id ?? "None")
			}
		}
		.onChange(of: selectedBusinessId) { oldValue, newValue in
			// find the business which matches the ID
			let business = model.businesses.first { business in
				business.id == selectedBusinessId
			}
			
			// if business is not found, set it to selected one
			if business != nil {
				model.selectedBusiness = business!
			}
		}
    }
}

#Preview {
    MapView()
		.environment(BusinessModel())
}
