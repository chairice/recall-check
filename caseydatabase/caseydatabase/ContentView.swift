//
//  ContentView.swift
//  caseydatabase
//
//  Created by Casey Feng on 9/28/24.
//

import SwiftUI

struct ContentView: View {
    @State private var products: [Item_S] = []

    var body: some View {
        VStack {
            List($products, id: \.self) { product in
                VStack(alignment: .leading) {
                    Text("Barcode: \(product.barcode ?? "N/A")")
                    Text("Name: \(product.name ?? "N/A")")
                    Text("Date: \(product.date ?? "N/A")")
                    Text("Quantity: \(product.quantity)")
                }
            }
        }
        .padding()
        .onAppear {
            fetchProducts()
            loadProductsFromCFile()
        }
    }

    private func fetchProducts() {
        products = CoreDataManager.shared.fetchProducts()
    }

    private func loadProductsFromCFile() {
        // Simulated reading from C file
        let productFromCFile = Item("123456789012", "Sample Product", "2024-01-01", 1)
        
        let productWrapper = ProductWrapper(product: productFromCFile)
        CoreDataManager.shared.saveProduct(product: productWrapper)
        
        // Refresh the product list after saving
        fetchProducts()
    }
}

@main
struct YourProjectNameApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
