import SwiftUI

struct TodoItemsView: View {
    @State private var isAddingItem = false
    @State private var isEdditingItem = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    NavigationLink(destination: EditingItemView()) {
                        Button(action: {}) {
                            Text("Test")
                        }
                    }
                }
            }
            .navigationBarTitle("Todo Items", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button (action: {
                        isAddingItem = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isAddingItem) {
                NavigationStack {
                    AddingItemView()
                        .navigationBarTitle("Adding Items", displayMode: .inline)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Cancel") {
                                    isAddingItem = false
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Done") {
                                    isAddingItem = false
                                }
                            }
                        }
                }
            }
        }
    }
}

struct TodoItemView_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemsView()
    }
}
