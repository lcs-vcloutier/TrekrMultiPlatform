//
//  TipsList.swift
//  TrekrMultiPlatform
//
//  Created by Vincent Cloutier on 2022-01-18.
//

import SwiftUI

struct TipsList: View {
    
    // Establishes an initial connection to the view model for tips -> still a source of truth though that's why @StateObject
     @StateObject var dataStore = TipStore()

    var body: some View {

        List(dataStore.tips, id: \.text, children: \.children) { tip in
            
            //if there are children on this particular tip
            if tip.children != nil {
                Label(tip.text, systemImage: "quote.bubble")
            } else {
            Text(tip.text)
            }
        }
    }
}

