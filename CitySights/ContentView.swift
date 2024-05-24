//
//  ContentView.swift
//  CitySights
//
//  Created by Jev Smolnikov on 24/05/2024.
//

import SwiftUI

struct ContentView: View {
	
	@State var businesses = [Business]()
	@State var query: String = ""
	var dataService = DataService()
	
	var body: some View {
		VStack {
			HStack {
				TextField("What are you searching for?", text: $query)
					.textFieldStyle(.roundedBorder)
				Button {
					// action
				} label: {
					Text("Go")
				}
				.padding(.horizontal)
			}
			.padding(.horizontal)
			List {
				ForEach(businesses) { b in
					VStack(spacing: 20) {
						HStack(spacing: 10) {
							Image("list-placeholder-image")
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
				}
				.listRowSeparator(.hidden)
			}
			.listStyle(.plain)
		}
		.task {
			businesses = await dataService.businessSearch()
		}
	}
}

#Preview {
	ContentView()
}
