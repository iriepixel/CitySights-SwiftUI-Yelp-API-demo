//
//  OnboardingView.swift
//  CitySights
//
//  Created by Jev Smolnikov on 29/05/2024.
//

import SwiftUI

struct OnboardingView: View {
	
	@Environment(BusinessModel.self) var model
	@Environment(\.dismiss) var dismiss
	@State var selectedViewIndex = 0
	
    var body: some View {
		ZStack {
			
			if selectedViewIndex == 0 {
				Color(red: 111/255, green: 154/255, blue: 189/255)
			} else {
				Color(red: 139/255, green: 166/255, blue: 65/255)
			}
			
			TabView(selection: $selectedViewIndex) {
				
				OnboardingDetailsView(
					bgColor: Color(red: 111/255, green: 154/255, blue: 189/255),
					headline: "Welsome to City Sights",
					subHeadline: "City Sights helps you to find the best of the city",
					buttonAction: {
						withAnimation{
							selectedViewIndex = 1
						}
					}
				)
				.tag(0)
				.ignoresSafeArea()
				
				OnboardingDetailsView(
					bgColor: Color(red: 139/255, green: 166/255, blue: 65/255),
					headline: "Discover your city",
					subHeadline: "We'll show you the best restaraunts, venues and more, based on your location",
					buttonAction: {
						model.getUserLocation()
						dismiss()
					}
				)
				.tag(1)
				.ignoresSafeArea()
			}
			.tabViewStyle(.page(indexDisplayMode: .never))
			
			VStack {
				Spacer()
				HStack(spacing: 16) {
					Circle()
						.frame(width: 10)
						.foregroundColor(selectedViewIndex == 0 ? .white : .gray)
					Circle()
						.frame(width: 10)
						.foregroundColor(selectedViewIndex == 1 ? .white : .gray)
				}
				.padding(.bottom, 220)
			}
		}
		.ignoresSafeArea()
    }
}

#Preview {
    OnboardingView()
}
