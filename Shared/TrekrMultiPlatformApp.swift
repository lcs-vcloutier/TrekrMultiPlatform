//
//  TrekrMultiPlatformApp.swift
//  Shared
//
//  Created by Vincent Cloutier on 2022-01-18.
//

import SwiftUI

@main
struct TrekrMultiPlatformApp: App {
    
    @StateObject var store = LocationStore()
    @StateObject var favorites = Favorites()

    var body: some Scene {
        WindowGroup {
            
            TabView {
                NavigationView {
                    LocationsList(favorites: favorites, store: store)
                }
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Locations")
                }.environmentObject(favorites)
                
                
                
#if os(iOS)
                
                NavigationView {
                    WorldMap(store: store)
                }
                .tabItem {
                    Image(systemName: "map")
                    Text("Map")
                }
                
                
#else
                NavigationView {
                    WorldMap(store: store)
                        .frame(width: 400)
                }
                .tabItem {
                    Image(systemName: "map")
                    Text("Map")
                }
#endif
                
#if os(iOS)
                NavigationView {
                    TipsList()
                }
                .tabItem {
                    Image(systemName: "person.fill.questionmark")
                    Text("Tips")
                }
#else
                TipsList()
                    .tabItem {
                        Image(systemName: "person.fill.questionmark")
                        Text("Tips")

                    }
#endif
                
            }
        }
    }
}
