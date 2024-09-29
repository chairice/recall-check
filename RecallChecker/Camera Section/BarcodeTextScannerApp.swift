//
//  BarcodeTextScannerApp.swift
//  RecallChecker
//
//  Created by Pari Gulati on 9/28/24.
//

import SwiftUI
@main
struct BarcodeTextScannerApp: App {
    
    @StateObject private var vm = AppViewModel()
    
    var body: some Scene {
        WindowGroup {
            CameraView()
                .environmentObject(vm)
                .task {
                    await vm.requestDataScannerAccessStatus()
                }
        }
    }
}
