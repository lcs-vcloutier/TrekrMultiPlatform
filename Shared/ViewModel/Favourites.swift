//
//  Favourites.swift
//  TrekrMultiPlatform
//
//  Created by Vincent Cloutier on 2022-01-19.
//

import Foundation


class Favorites: ObservableObject {
    // the actual resorts the user has favorited
     var savedFavourites: Set<String>

    // the key we're using to read/write in UserDefaults
    private let saveKey = "Favorites"
    let defaults = UserDefaults.standard
    
    
    init() {
        let decoder = JSONDecoder()
        if let data = defaults.value(forKey: saveKey) as? Data {
            let favouritesData = try? decoder.decode(Set<String>.self, from: data)
            self.savedFavourites = favouritesData ?? []
        } else {
            self.savedFavourites = []
        }
    }

    // returns true if our set contains this resort
    func contains(_ location: Location) -> Bool {
        savedFavourites.contains("\(location.id)")
    }

    // adds the resort to our set, updates all views, and saves the change
    func add(_ location: Location) {
        objectWillChange.send()
        savedFavourites.insert("\(location.id)")
        save()
    }

    // removes the resort from our set, updates all views, and saves the change
    func remove(_ location: Location) {
        objectWillChange.send()
        savedFavourites.remove("\(location.id)")
        save()
    }

    func save() {
        // write out our data
//        defaults.set(encoded, forKey: saveKey)

        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(savedFavourites) {
            defaults.set(encoded, forKey: saveKey)
        }
    }
}
