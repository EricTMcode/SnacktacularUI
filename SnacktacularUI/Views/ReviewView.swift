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
        VStack {
            VStack(alignment: .leading) {
                Text(spot.name)
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.leading)
                    .lineLimit(1)
                
                Text(spot.address)
                    .padding(.bottom)
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Click to Rate:")
                .font(.title2)
                .bold()
            
            HStack {
                ForEach(0...4, id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .foregroundColor(.red)
                        .font(.largeTitle)
                }
            }
            .padding(.bottom)
            
            VStack(alignment: .leading) {
                Text("Review Title:")
                    .bold()
                
                TextField("title", text: $review.title)
                    .textFieldStyle(.roundedBorder)
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.gray.opacity(0.5), lineWidth: 2)
                    }
                
                Text("Review")
                    .bold()
                    
                TextField("review", text: $review.body, axis: .vertical)
                    .padding(.horizontal, 6)
                    .frame(maxHeight: .infinity, alignment: .topLeading)
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.gray.opacity(0.5), lineWidth: 2)
                    }
            }
            .padding(.horizontal)
            .font(.title2)
            
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    dismiss()
                }
            }
        }
    }
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ReviewView(spot: Spot(name: "Shake Shack", address: "49 Boyleston St., Chestnut Hill, MA 02467"), review: Review())
        }
    }
}
