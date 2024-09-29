import SwiftUI
import MongoSwift

class MongoDBManager: ObservableObject {
    private var client: MongoClient
    private var database: MongoDatabase
    private var collection: MongoCollection<Document>

    init() throws {
        // Replace with your MongoDB connection string
        let mongoDBConnectionString = "your_mongodb_connection_string"
        self.client = try MongoClient(mongoDBConnectionString)
        self.database = client.db("your_database_name")
        self.collection = database.collection("your_collection_name")
    }

    func createDocument(document: Document) {
        do {
            let _ = try collection.insertOne(document)
            print("Document inserted: \(document)")
        } catch {
            print("Failed to insert document: \(error)")
        }
    }

    func readDocuments() {
        do {
            let documents = try collection.find()
            for document in documents {
                print("Document: \(document)")
            }
        } catch {
            print("Failed to read documents: \(error)")
        }
    }

    func updateDocument(filter: Document, update: Document) {
        do {
            let result = try collection.updateOne(filter: filter, update: update)
            if let matchedCount = result?.matchedCount, matchedCount > 0 {
                print("Document updated successfully.")
            } else {
                print("No document found with the given filter.")
            }
        } catch {
            print("Failed to update document: \(error)")
        }
    }

    func deleteDocument(filter: Document) {
        do {
            let result = try collection.deleteOne(filter: filter)
            if let deletedCount = result?.deletedCount, deletedCount > 0 {
                print("Document deleted successfully.")
            } else {
                print("No document found to delete.")
            }
        } catch {
            print("Failed to delete document: \(error)")
        }
    }

    func closeConnection() {
        client = MongoClient("") // Resetting the client closes the connection
    }
}

struct DataView: View {
    @StateObject var mongoDBManager = try! MongoDBManager()

    var body: some View {
        VStack {
            Button("Create Document") {
                let document: Document = [
                    "name": "John Doe",
                    "age": 30,
                    "email": "johndoe@example.com"
                ]
                mongoDBManager.createDocument(document: document)
            }

            Button("Read Documents") {
                mongoDBManager.readDocuments()
            }

            Button("Update Document") {
                let filter: Document = ["name": "John Doe"]
                let update: Document = ["$set": ["age": 31]]
                mongoDBManager.updateDocument(filter: filter, update: update)
            }

            Button("Delete Document") {
                let filter: Document = ["name": "John Doe"]
                mongoDBManager.deleteDocument(filter: filter)
            }
        }
        .padding()
        .onDisappear {
            mongoDBManager.closeConnection()
        }
    }
}

@main
struct MongoDBSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            DataView()
        }
    }
}