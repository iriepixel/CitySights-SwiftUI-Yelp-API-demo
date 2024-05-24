//
//  ContentView.swift
//  CitySights
//
//  Created by Jev Smolnikov on 24/05/2024.
//

import SwiftUI

struct ContentView: View {
	
	@State var query: String = ""
	
	var body: some View {
		HStack {
			TextField("What are you searching for?", text: $query)
				.textFieldStyle(.roundedBorder)
			Button {
				// action
			} label: {
				Text("Go")
			}
		}
		.padding()
	}
}

#Preview {
	ContentView()
}
