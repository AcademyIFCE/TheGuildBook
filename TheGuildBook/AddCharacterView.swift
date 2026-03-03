import SwiftUI
import SwiftData

struct AddCharacterView: View {
    @Environment(\.modelContext)
    private var modelContext
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var name: String = ""
    @State private var level: Int = 1
    @State private var job: Job = .warrior
    @State private var description: String = ""
    
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
                        if !name.isEmpty {
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
                        Text("Are you sure you want to discard this new character?")
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button(role: .confirm) {
                        let newCharacter = Character(
                            name: name,
                            job: job,
                            level: level,
                            characterDescription: description.isEmpty ? nil : description
                        )
                        modelContext.insert(newCharacter)
                        dismiss()
                    }
                    .disabled(name.isEmpty)
                }
            }
            
        }
    }
}

#Preview {
    AddCharacterView()
}
