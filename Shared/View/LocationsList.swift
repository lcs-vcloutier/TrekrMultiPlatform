//
//  LocationsList.swift
//  TrekrMultiPlatform
//
//  Created by Vincent Cloutier on 2022-01-18.
//

import SwiftUI

struct LocationsList: View {
    @ObservedObject var favorites: Favorites
    @ObservedObject var store: LocationStore
    @State private var searchText = ""
    @State private var favouritesDisplayed = false
    var body: some View {
        List {
            ForEach(searchResults, id: \.name) { location in
                NavigationLink(destination: LocationDetail(location: location)) {
                    HStack {
                        Image(location.heroPicture)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 44, height: 44)
                        VStack(alignment: .leading) {
                            Text(location.name)
                            Text(location.country)
                                .font(.subheadline)
                        }
                        Spacer()
                        if self.favorites.contains(location) {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                                .padding()
                        }
                    }
                }
            }
        }
        .searchable(text: $searchText)
        .navigationTitle("Locations")
        .toolbar {
            ToolbarItem(placement: .automatic) {
                Toggle(isOn: $favouritesDisplayed, label: {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                })
                    .toggleStyle(.switch)
                
            }
        }
    }
    
    var searchResults: [Location] {
        if favouritesDisplayed == false {
            if searchText.isEmpty {
                return store.places
            } else {
                return store.places.filter {$0.name.contains(searchText) }
            }
        } else {
            return store.places.filter {$0.name.contains(searchText)}
        }
    }
}
