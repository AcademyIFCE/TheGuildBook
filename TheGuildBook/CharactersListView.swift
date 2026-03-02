import SwiftUI

struct CharactersListView: View {
    
    @State private var isShowingAddSheet: Bool = false
    
    @State private var characters: [Character] = [
        Character(
            name: "Edgin Darvis",
            job: .archer,
            level: 1,
            description: "A charismatic bard and skilled strategist who relies on wit and agility in battle."
        ),
        Character(
            name: "Holga Kilgore",
            job: .assassin,
            level: 1,
            description: "A fearless warrior with unmatched strength and loyalty to her companions."
        ),
        Character(
            name: "Simon Aumar",
            job: .hunter,
            level: 1,
            description: "An insecure but talented sorcerer struggling to unlock his true magical potential."
        ),
        Character(
            name: "Doric",
            job: .mage,
            level: 1,
            description: "A shape-shifting druid deeply connected to nature and fiercely protective of her land."
        ),
        Character(
            name: "Xenk Yendar",
            job: .paladin,
            level: 1,
            description: "A noble paladin guided by honor, righteousness, and unwavering moral principles."
        ),
        Character(
            name: "Forge Fitzwilliam",
            job: .rogue,
            level: 1,
            description: "A cunning and ambitious con artist who always has a hidden agenda."
        ),
        Character(
            name: "Sofina",
            job: .wizard,
            level: 1,
            description: "A mysterious and powerful red wizard with dark intentions."
        ),
        Character(
            name: "Kira Darvis",
            job: .wizard,
            level: 1,
            description: "A brave and clever young girl growing up in a world full of danger and magic."
        )
    ]

    var body: some View {
        NavigationStack {
            List {
                ForEach($characters) { $character in
                    NavigationLink {
                        CharacterDetailView(character: $character)
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
