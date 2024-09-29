import MongoSwift

// MongoDB connection string
let mongoDBConnectionString = "mongodb+srv://caseyyf:stanchair.%3C3@cluster65788.kwa7w.mongodb.net/"

do {
    // Create a MongoDB client
    let client = try MongoClient(mongoDBConnectionString)

    // Access the database and collection
    let database = client.db("saved_data")
    let collection = database.collection("items")

    // Create a document
    let newDocument: Document = ["name": "Test Item", "value": 42]
    
    // Insert the document
    let insertResult = try collection.insertOne(newDocument)
    print("Inserted document with id: \(insertResult.insertedId)")

    // Update the document
    let filter: Document = ["_id": insertResult.insertedId] // Use the inserted ID to find the document
    let update: Document = ["$set": ["value": 100]] // Update the "value" field

    let updateResult = try collection.updateOne(filter: filter, update: update)
    if let matchedCount = updateResult.matchedCount, matchedCount > 0 {
        print("Updated document successfully.")
    } else {
        print("No document found with the given filter.")
    }

} catch {
    print("Error: \(error)")
}