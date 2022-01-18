//
//  Tip.swift
//  TrekrMultiPlatform
//
//  Created by Vincent Cloutier on 2022-01-18.
//

import Foundation
struct Tip: Decodable {
    let text: String
    let children: [Tip]?
}
