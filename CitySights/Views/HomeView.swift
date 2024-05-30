//
//  ContentView.swift
//  CitySights
//
//  Created by Jev Smolnikov on 24/05/2024.
//

import SwiftUI

struct HomeView: View {
	
	@Environment(BusinessModel.self) var model
	@State var selectedTab = 0
	
	@State var query: String = ""
	@FocusState var queryBoxFocused: Bool
	
	@State var showOptions = false
	@State var popularOn = false
	@State var dealsOn = false
	@State var categorySelection = "restaurants"
	
	var body: some View {
		
		@Bindable var model = model
		
		VStack(spacing: 10) {
			HStack {
				Text("My City Sights")
					.font(.title)
					.bold()
				Spacer()
			}
			.padding(.horizontal)
			.padding(.top, 20)
			HStack {
				TextField("What are you searching for?", text: $query)
					.textFieldStyle(.roundedBorder)
					.focused($queryBoxFocused)
					.onTapGesture {
						withAnimation {
							showOptions = true
						}
					}
				Button {
					withAnimation {
						showOptions = false
						queryBoxFocused = false
					}
					
					// Perform a search
					model.getBusinesses(query: query, options: getOptionsString(), category: categorySelection)
					
				} label: {
					Text("Search")
				}
				.padding()
			}
			.padding(.horizontal)
			
			// Query options. Show if textbox focused
			if showOptions {
				VStack {
					Toggle("Popular", isOn: $popularOn)
					Toggle("Deals", isOn: $dealsOn)
					
					HStack {
						Text("Category")
						Spacer()
						Picker("Category", selection: $categorySelection) {
							Text("Restaurants")
								.tag("restaurants")
							Text("Arts")
								.tag("arts")
						}
					}
				}
				.padding(.vertical, 20)
				.padding(.horizontal, 40)
				.transition(.scale)
			}
			
			Picker("", selection: $selectedTab) {
				Text("List")
					.tag(0)
				Text("Map")
					.tag(1)
			}
			.pickerStyle(SegmentedPickerStyle())
			.padding(.horizontal)
			
			if model.locationAuthStatus == .denied {
				Spacer()
				Text("Please allow location services for this app to see soghts near you.")
					.multilineTextAlignment(.center)
					.padding(.horizontal, 40)
				Button(action: {
					if let url = URL(string: UIApplication.openSettingsURLString) {
						UIApplication.shared.open(url)
					}
				}, label: {
					Text("Open App Privacy Settings")
				})
					.buttonStyle(.bordered)
					.padding()
				Spacer()
				Spacer()
			} else {
				if selectedTab == 0 {
					ListView()
						.onTapGesture {
							withAnimation {
								showOptions = false
								queryBoxFocused = false
							}
						}
				} else {
					MapView()
						.onTapGesture {
							withAnimation {
								showOptions = false
								queryBoxFocused = false
							}
						}
				}
			}
		}
//		.onAppear{
//			model.getBusinesses(query: nil, options: nil, category: nil)
//		}
		.sheet(item: $model.selectedBusiness) { item in
			BusinessDetailView()
		}
	}
	
	func getOptionsString() -> String {
		var optionsArray = [String]()
		
		if popularOn {
			optionsArray.append("hot_and_new")
		}
		if dealsOn {
			optionsArray.append("deals")
		}
		
		return optionsArray.joined(separator: ",")
	}
}

#Preview {
	HomeView()
		.environment(BusinessModel())
}
