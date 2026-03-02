import SwiftUI

struct CharacterDetailView: View {
        
    @Binding var character: Character
    
    @State private var isShowingEditSheet: Bool = false
    
    var body: some View {
        List {
            LabeledContent("Class", value: character.job.title)
            LabeledContent("Level", value: "\(character.level)")
            LabeledContent("Description", value: "\(character.description ?? "-")")
        }
        .navigationTitle(character.name)
        .toolbarTitleDisplayMode(.inline)
        .toolbar {
            Button("Edit") {
                isShowingEditSheet = true
            }
        }
        .sheet(isPresented: $isShowingEditSheet) {
            EditCharacterView(character: $character)
        }
    }
}

#Preview {
    @Previewable @State var character = Character(
        name: "Edgin Darvis",
        job: .archer,
        level: 1,
        description: "A charismatic bard and skilled strategist who relies on wit and agility in battle."
    )
    NavigationStack {
        CharacterDetailView(character: $character)
    }
}
