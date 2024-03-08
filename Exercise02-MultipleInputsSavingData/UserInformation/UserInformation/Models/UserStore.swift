import Foundation

class UserStore: ObservableObject {
    @Published var user: User = User.emptyUser
    var temp = try! fileURL().path // for testing 
    
    private static func fileURL() throws -> URL {
            try FileManager.default.url(for: .documentDirectory,
                                        in: .userDomainMask,
                                        appropriateFor: nil,
                                        create: false)
            .appendingPathComponent("userinformation.data")
        }
    
    func save(user: User) async throws {
            let task = Task {
                let data = try JSONEncoder().encode(user)
                let outfile = try Self.fileURL()
                try data.write(to: outfile)
            }
            _ = try await task.value
        }
}
