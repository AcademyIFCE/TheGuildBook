import SwiftUI

struct CharacterDetailView: View {
        
    @Binding var character: Character
    
    @State private var isShowingEditSheet: Bool = false
    
    var body: some View {
        List {
            LabeledContent("Class", value: character.job ?? "None")
            LabeledContent("Level", value: "\(character.level)")
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
