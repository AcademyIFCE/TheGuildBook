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
    do {
        let configuration = ModelConfiguration()
        let container = try ModelContainer(for: Character.self, configurations: configuration)
        
        let characterList: [Character] = [
            Character(name: "Ashe", job: .archer, level: 1, characterDescription: "A good archer"),
            Character(name: "Mason", job: .assassin, level: 1, characterDescription: "An good friend")
        ]
        
        for character in characterList {
            container.mainContext.insert(character)
        }
        
        return CharactersListView()
            .modelContainer(container)
    } catch {
        return CharactersListView()
    }
    
}
