//
//  ProcuctCell.swift
//  APICall
//
//  Created by Anil on 13/04/25.
//

import SwiftUI

struct ProcuctCell: View {
    
    let Product: productItem
    var body: some View {
        HStack{
            if let url = URL(string: Product.image){
                AsyncImage(url: url) { image in
                    image.resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 100, height: 100)

            }
            VStack(alignment: .leading, spacing: 8){
                Text(Product.title)
                    .font(.headline)
                HStack{
                    Text(Product.category)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Spacer()
                    HStack{
                        Image(systemName: "star.fill")
                        Text(Product.ratting.rate.toString())
                    }
                    .fontWeight(.medium)
                    .foregroundColor(.yellow)
                }
                //Description
                Text(Product.description)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .lineLimit(3)
                
                //Price & Buy
                HStack{
                    Text("$" + Product.price.toString())
                        .font(.title3)
                        .foregroundColor(.indigo)
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Text("Buy")
                            .foregroundStyle(.white)
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(.indigo)
                            .clipShape(.capsule)
                            
                    }
                }
            }
        }.padding()
        
        
        
    }
}

#Preview {
    ProcuctCell(Product: productItem.dummy)
}
