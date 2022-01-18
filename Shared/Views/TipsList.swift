//
//  TipsList.swift
//  TrekrMultiPlatform
//
//  Created by Vincent Cloutier on 2022-01-18.
//

import SwiftUI

struct TipsList: View {
    
    // This view creates it's own source of truth
    let tips: [Tip]
    
    var body: some View {

        List(tips, id: \.text) { tip in
            
            //if there are children on this particular tip
            if tip.children != nil {
                Label(tip.text, systemImage: "quote.bubble")
            } else {
            Text(tip.text)
            }
        }
    }
    
    // Populates the array
    init() {
        // Get a pointer to the file
        let url = Bundle.main.url(forResource: "tips", withExtension: "json")!
        
        // Load the contencts of the JSON file
        let data = try! Data(contentsOf: url)
        
        // Convert the data from the JSON file into the array
        tips = try! JSONDecoder().decode([Tip].self, from: data)
        
    }
}

