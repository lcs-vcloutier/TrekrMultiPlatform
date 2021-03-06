//
//  LocationDetail.swift
//  TrekrMultiPlatform
//
//  Created by Vincent Cloutier on 2022-01-18.
//

import SwiftUI

struct LocationDetail: View {
    // The location to show details about
    // A copy of an instance of a struct will be provided to this view
    @EnvironmentObject var favorites: Favorites
    let location: Location
    var body: some View {
        ScrollView {
            Image(location.heroPicture)
                .resizable()
                .scaledToFit()
            HStack {
                Text(location.country)
                    .font(.title)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom)
                
                Spacer()
                
                Button {
                    if self.favorites.contains(self.location) {
                        self.favorites.remove(self.location)
                    } else {
                        self.favorites.add(self.location)
                    }
                } label: {
                    if favorites.contains(location) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    } else {
                        Image(systemName: "star")
                            .foregroundColor(.yellow)
                    }
                }.font(.title)
                    .padding(.bottom)

            }
            .padding(.horizontal)
            
            Text(location.description)
                .padding(.horizontal)
            
            HStack {
                Text("Did you know?")
                    .font(.title3)
                    .bold()
                    .padding(.vertical)
                
                Spacer()
            }
            .padding(.horizontal)
            
            // Conditionally show travel advisory
            if !location.advisory.isEmpty {
                
                // Show only the more without bottom padding
                Text(location.more)
                    .padding(.horizontal)
                
                HStack {
                    Text("Advisory")
                        .font(.title3)
                        .bold()
                        .padding(.vertical)
                    Spacer()
                }
                .padding(.horizontal)
                
                Text(location.advisory)
                    .padding([.horizontal, .bottom])
                
            } else {
                // Show the more with bottom padding
                Text(location.more)
                    .padding([.horizontal, .bottom])
            }
        }
        .navigationTitle(location.name)
    }
}
