//
//  TipStore.swift
//  TrekrMultiPlatform
//
//  Created by Vincent Cloutier on 2022-01-20.
//

import Foundation

class TipStore: ObservableObject {

     let tips: [Tip]

     // Initializer pulls tips data from JSON
     // Populates the array
     init() {

         // Get a pointer to the file
         let url = Bundle.main.url(forResource: "tips", withExtension: "json")!

         // Load the contents of the JSON file
         let data = try! Data(contentsOf: url)

         // Convert the data from the JSON file into the array
         tips = try! JSONDecoder().decode([Tip].self, from: data)

     }

 }
