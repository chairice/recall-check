//
//  Productwrapper.swift
//  caseydatabase
//
//  Created by Casey Feng on 9/28/24.
//

import Foundation

struct ProductWrapper {
    var product: Item_S

    var barcode: String {
        return String(cString: product.barcode)
    }

    var name: String {
        return String(cString: product.name)
    }

    var date: Date {
        return Date(cString: product.date)
    }

    var recalled: Int32 {
        return product.recalled
    }
}
