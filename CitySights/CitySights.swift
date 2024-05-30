//
//  CitySightsApp.swift
//  CitySights
//
//  Created by Jev Smolnikov on 24/05/2024.
//

import SwiftUI

@main
struct CitySights: App {
	
	@State var model = BusinessModel()
	@AppStorage("onboarding") var needsOnboarding = true
	
    var body: some Scene {
        WindowGroup {
            HomeView()
				.environment(model)
				.fullScreenCover(isPresented: $needsOnboarding, onDismiss: {
					// on dismiss
					needsOnboarding = false
				}, content: {
					OnboardingView()
						.environment(model)
				})
				.onAppear {
					// If no onboarding is needed, still get location
					if needsOnboarding == false && model.locationAuthStatus == .notDetermined {
						model.getUserLocation()
					}
				}
        }
    }
}
