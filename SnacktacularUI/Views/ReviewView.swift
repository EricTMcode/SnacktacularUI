//
//  ReviewView.swift
//  SnacktacularUI
//
//  Created by Eric on 08/05/2023.
//

import SwiftUI

struct ReviewView: View {
    @State var spot: Spot
    @State var review: Review
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView(spot: Spot(name: "Shake Shack", address: "$( Boyleston St., Chestnut Hill, MA 02467"), review: Review())
    }
}
