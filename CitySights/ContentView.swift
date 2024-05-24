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
			}
			List(businesses) {b in
				Text(b.name ?? "No Title")
			}
		}
		.padding()
		.task {
			businesses = await dataService.businessSearch()
		}
	}
}

#Preview {
	ContentView()
}
