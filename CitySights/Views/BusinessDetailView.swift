//
//  BusinessDetailView.swift
//  CitySights
//
//  Created by Jev Smolnikov on 28/05/2024.
//

import SwiftUI

struct BusinessDetailView: View {
	
	@Environment(BusinessModel.self) var model
	
    var body: some View {
		
		let business = model.selectedBusiness
		
		VStack(spacing: 0) {
			ZStack(alignment: .bottomTrailing) {
				if let imageUrl = business?.image_url {
					AsyncImage(url: URL(string: imageUrl)) { image in
						image
							.resizable()
							.aspectRatio(contentMode: .fill)
							.frame(height: 200)
							.clipped()
					} placeholder: {
						ProgressView()
							.frame(width: 50, height: 50)
					}

				} else {
					Image("detail-placeholder-image")
						.resizable()
				}
				Image("yelp-attribution-image")
					.frame(height: 36)
			}
			.frame(height: 200)
			
			if let isClosed = business?.is_closed {
				ZStack(alignment: .leading) {
					Rectangle()
						.foregroundColor(isClosed ? .red : .green)
					
					Text(isClosed ? "Close" : "Open")
						.font(Font.system(size: 17))
						.foregroundColor(.white)
						.padding(.horizontal)
				}
				.frame(height: 36)
			}
			
			ScrollView {
				VStack(alignment: .leading){
					VStack(alignment: .leading) {
						Text(business?.name ?? "Business Name")
							.font(Font.system(size: 21))
							.bold()
							.padding(.bottom, 5)
					
						Text("\(business?.location?.address1 ?? ""), \(business?.location?.city ?? "")")
							.font(Font.system(size: 13))
							.foregroundColor(.gray)
						Text("\(business?.location?.state ?? "") \(business?.location?.zip_code ?? ""), \(business?.location?.country ?? "")")
							.font(Font.system(size: 13))
							.foregroundColor(.gray)
							.padding(.bottom, 5)
						
						Image("regular_\(TextHelper.roundRating(rating: business?.rating ?? 0))")
					}
					.padding(.bottom, 15)
					
					VStack(spacing: 15) {
						Divider()
						HStack(spacing: 10) {
							Image(systemName: "phone")
							
							if let phone = URL(string: "tel:\(business?.phone ?? "")") {
								Link(destination: phone) {
									Text("\(business?.display_phone ?? "")")
										.font(Font.system(size: 13))
										.foregroundColor(.black)
								}
							}
							Spacer()
							Image(systemName: "arrow.forward")
						}
						Divider()
						HStack(spacing: 10) {
							Image(systemName: "globe")
							
							if let url = URL(string: business?.url ?? "") {
								Link(destination: url, label: {
									Text("Yelp URL")
										.lineLimit(1)
										.font(Font.system(size: 13))
										.foregroundColor(.black)
								})
							}
							
							Spacer()
							Image(systemName: "arrow.forward")
						}
						Divider()
						HStack(spacing: 10) {
							Image(systemName: "bubble.left.and.bubble.right")
							Text("\(business?.review_count ?? 0)")
								.font(Font.system(size: 13))
							Spacer()
						}
					}
				}
			}
			.padding()
		}
    }
}

#Preview {
    BusinessDetailView()
		.environment(BusinessModel())
}
