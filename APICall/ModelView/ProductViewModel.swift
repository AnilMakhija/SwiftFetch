//
//  ProductViewModel.swift
//  APICall
//
//  Created by Anil on 13/04/25.
//

import Foundation

@Observable class ProductViewModel {
    
    var product:[productItem] = []
    private var apiClient = APIManager()
    func fetchProduct() async {
        do{
            product = try await apiClient.request(url: "https://fakestoreapi.com/products")
            print(product)
        }catch{
            print("Fetch Product Error",error)
        }
    }
}
