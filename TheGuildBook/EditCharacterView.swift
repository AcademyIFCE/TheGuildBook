import SwiftUI

struct EditCharacterView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Binding var character: Character
    
    @State private var name: String = ""
    @State private var description: String = ""
    @State private var level: Int = 1
    @State private var job: Job = .warrior
    
    @State private var discardChanges = false
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                TextField("Description (Optional)", text: $description, axis: .vertical)
                    .lineLimit(3)
                    .frame(height: 80, alignment: .top)
                    .multilineTextAlignment(.leading)
                Picker("Job", selection: $job) {
                    ForEach(Job.allCases) { job in
                        Text(job.title).tag(job)
                    }
                }
                Stepper("Level \(level)", value: $level, in: 1...20)

            }
            .navigationTitle("New")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(role: .cancel) {
                        if !name.isEmpty || !description.isEmpty{
                            discardChanges = true
                        } else {
                            dismiss()
                        }
                    }
                    .confirmationDialog("Discard Changes", isPresented: $discardChanges) {
                        Button("Discard Changes", role: .destructive) {
                            dismiss()
                        }
                    } message: {
                        Text("Are you sure you want to discard these changes?")
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button(role: .confirm) {
                        save()
                        dismiss()
                    }
                    .disabled(name.isEmpty)
                }
            }
            .onAppear {
                name = character.name
                job = character.job
                level = character.level
                description = character.description ?? ""
            }
            
        }
    }
    
    private func save() {
        character.name = name
        character.job = job
        character.level = level
        character.description = description.isEmpty ? nil : description
    }
}

#Preview {
    AddCharacterView(characters: .constant([]))
}

