//
//  ListView.swift
//  CitySights
//
//  Created by Jev Smolnikov on 28/05/2024.
//

import SwiftUI

struct ListView: View {
	
	@Environment(BusinessModel.self) var model
	
    var body: some View {
		List {
			ForEach(model.businesses) { b in
				VStack(spacing: 20) {
					HStack(spacing: 10) {
						
						if let imageUrl = b.image_url {
							AsyncImage(url: URL(string: imageUrl)) { image in
								image
									.resizable()
									.aspectRatio(contentMode: .fill)
									.frame(width: 80, height: 70)
									.clipShape(RoundedRectangle(cornerRadius: 6))
							}
							placeholder: {
								ProgressView()
									.frame(width: 80, height: 70)
							}
						} else {
							Image("list-placeholder-image")
						}
						
						VStack(alignment: .leading, spacing: 3) {
							Text(b.name ?? "No Title")
								.font(Font.system(size: 16))
								.bold()
							Text(TextHelper.distanceAwayText(meters: b.distance ?? 0))
								.font(Font.system(size: 14))
								.foregroundColor(.gray)
						}
						Spacer()
						Image("regular_\(TextHelper.roundRating(rating: b.rating ?? 0))")
					}
					Divider()
				}
				.onTapGesture {
					model.selectedBusiness = b
					// print(b.name ?? "Business without a name")
				}
			}
			.listRowSeparator(.hidden)
		}
		.listStyle(.plain)
    }
}

#Preview {
    ListView()
		.environment(BusinessModel())
}
