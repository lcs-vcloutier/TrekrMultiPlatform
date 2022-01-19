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
    @State private var favouritesToDisplay: [Location] = []
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
    }
    
    var searchResults: [Location] {
            if searchText.isEmpty {
                return store.places
            } else {
                return store.places.filter {$0.name.contains(searchText) }
            }
    }
}
