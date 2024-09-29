let dates_array = ["09/19/24", "09/19/24", "12/29/17", "03/12/18", "07/12/10", "06/14/19"] //recalled products dates
let all_barcodes_array = ["041383090738","665973011318","1111042145", "76663098023","000000004011","781520710", "016000131583", "035000741264","","",""] //all barcodes
let names_array = ["Lactaid", "Dynacare", "Comforts_Baby_Purified_Water", "Wegmans", "Starbucks", "Losartan", "Colgate toothpaste granola bar", "Nature Valley Granola Bars"] //all names
let recalled_array = ["041383090738","665973011318","1111042145", "76663098023","000000004011","781520710"] //recalled products barcodes
// Create a struct to represent a recalled item
struct RecalledItem {
    let barcode: String
    let name: String
    let dateRecalled: String
}

// Function to check if a string has 13 characters (12 for UPC without check digit)
func isLengthThirteen(_ string: String) -> Bool {
    return string.count == 12
}

func checkBarcode(_ barcode: String) -> [String] {
    for (index, code) in all_barcodes_array.enumerated() {
        if code == barcode {
            // Match found
            let date = index < dates_array.count ? dates_array[index] : ""
            let name = index < names_array.count ? names_array[index] : ""
            return [barcode, "red", date, name]
        }
    }
    // No match found
    return [barcode, "green"]
}

