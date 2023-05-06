//
//  Spot.swift
//  SnacktacularUI
//
//  Created by Eric on 05/05/2023.
//

import Foundation
import FirebaseFirestoreSwift

struct Spot: Identifiable, Codable {
    @DocumentID var id: String?
    var name = ""
    var address = ""
    var latitude = 0.0
    var longitude = 0.0
    
    var dictionary: [String: Any] {
        return ["name": name, "address": address, "latitude": latitude, "longitude": longitude]
    }
}
