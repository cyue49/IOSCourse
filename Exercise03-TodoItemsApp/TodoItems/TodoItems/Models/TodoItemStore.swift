import Foundation

@MainActor
class TodoItemStore: ObservableObject {
    @Published var items: [TodoItem] = []
    var temp = try! getFileURL().path // for testing
    
    private static func getFileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("userinformation.data")
    }
    
    // reading from file
    func load() async throws {
        let task = Task<[TodoItem], Error> {
            let fileURL = try Self.getFileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            let items = try JSONDecoder().decode([TodoItem].self, from: data)
            return items
        }
        let items = try await task.value
        self.items = items
    }
    
    // writing to file
    func save(items: [TodoItem]) async throws {
        let task = Task {
            // write to csv file
            // try todoItemsListToString(list: items).write(toFile: Self.getFileURL().path, atomically: true, encoding: String.Encoding.utf8)
            
            // encode to json
            let data = try JSONEncoder().encode(items)
            let outfile = try Self.getFileURL()
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
    
    // list of items to string for line of data in csv file
    private func todoItemsListToString(list: [TodoItem]) -> String {
        var str = ""
        for item in list {
            str += item.title + ";" + item.description + ";" + item.dueDate.description + ";\(item.completed);\(item.deleted)\n"
        }
        return str
    }
}
