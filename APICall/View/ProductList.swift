//
//  ProductList.swift
//  APICall
//
//  Created by Anil on 13/04/25.
//

import SwiftUI

struct ProductList: View {
    
    let viewModel = ProductViewModel()
    var body: some View {
        NavigationStack{
            List(viewModel.product) { product in
                ProcuctCell(Product: product)
                
            }
            .navigationTitle("Products")
        }
        .task {
            await viewModel.fetchProduct()
        }
    }
}

#Preview {
    ProductList()
}
