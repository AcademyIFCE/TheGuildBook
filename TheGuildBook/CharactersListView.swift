import SwiftUI

struct CharactersListView: View {
    
    @State private var isShowingAddSheet: Bool = false
    
    @State private var characters: [Character] = [
        Character(name: "Edgin Darvis", job: "Bard", level: 1),
        Character(name: "Holga Kilgore", job: "Barbarian", level: 1),
        Character(name: "Simon Aumar", job: "Sorcerer", level: 1),
        Character(name: "Doric", job: "Druid", level: 1),
        Character(name: "Xenk Yendar", job: "Paladin", level: 1),
        Character(name: "Forge Fitzwilliam", job: "Rogue", level: 1),
        Character(name: "Sofina", job: "Wizard", level: 1),
        Character(name: "Kira Darvis", job: nil, level: 1)
    ]

    var body: some View {
        NavigationStack {
            List {
                ForEach($characters) { $character in
                    NavigationLink {
                        CharacterDetailView(character: $character)
                    } label: {
                        Text(character.name)
                    }
                }
                .onDelete { offsets in
                    characters.remove(atOffsets: offsets)
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
                AddCharacterView(characters: $characters)
            }
        }
    }

}

#Preview {
    CharactersListView()
}
