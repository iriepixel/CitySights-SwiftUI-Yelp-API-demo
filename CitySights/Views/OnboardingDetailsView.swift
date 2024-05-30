//
//  OnboardingDetailsView.swift
//  CitySights
//
//  Created by Jev Smolnikov on 29/05/2024.
//

import SwiftUI

struct OnboardingDetailsView: View {
	
	var bgColor: Color
	var headline: String
	var subHeadline: String
	var buttonAction: () -> Void
	
    var body: some View {
		ZStack {
			Color(bgColor)
			VStack(spacing: 0) {
				Spacer()
				Spacer()
				
				Image("onboarding")
				
				Text(headline)
					.font(Font.system(size: 22))
					.bold()
					.padding(.top, 40)
				
				Text(subHeadline)
					.multilineTextAlignment(.center)
					.padding(.top, 10)
				
				Spacer()
				
				Button(action: {
					buttonAction()
				}, label: {
					ZStack {
						RoundedRectangle(cornerRadius: 10)
							.foregroundColor(.white)
							.frame(height: 50)
						Text("Continue")
							.bold()
							.foregroundStyle(.black)
					}
				})
				.padding(.horizontal)
				.padding(.bottom, 120)
			}
			.padding(.horizontal)
			.foregroundColor(.white)
		}
    }
}

#Preview {
    OnboardingDetailsView(
		bgColor: Color(red: 111/255, green: 154/255, blue: 189/255),
		headline: "Welsome to City Sights",
		subHeadline: "City Sights helps you to find the best of the city",
		buttonAction: {}
	)
}
