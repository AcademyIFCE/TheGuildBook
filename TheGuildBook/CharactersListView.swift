import SwiftUI
import SwiftData

struct CharactersListView: View {
    @Environment(\.modelContext) var modelContext
    
    @State private var isShowingAddSheet: Bool = false
    
    @Query(sort: \Character.name)
    private var characters: [Character]
        
    var body: some View {
        NavigationStack {
            List {
                ForEach(characters) { character in
                    NavigationLink {
                        CharacterDetailView(character: character)
                    } label: {
                        HStack {
                            Text(character.job.emoji)
                            VStack(alignment: .leading) {
                                Text(character.name)
                                Text("Level \(character.level)")
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
                .onDelete { offsets in
                    for index in offsets {
                        let character = characters[index]
                        modelContext.delete(character)
                    }
                }
            }
            .navigationTitle("Characters")
            .toolbar {
                Button {
                    isShowingAddSheet = true
                } label: {
                    Label("Add", systemImage: "plus")
                }
            }
            .sheet(isPresented: $isShowingAddSheet) {
                AddCharacterView()
            }
        }
    }

}

#Preview {
    CharactersListView()
}
