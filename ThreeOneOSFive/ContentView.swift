importimport SwiftUI

struct ContentView: View {
    @EnvironmentObject private var patchStore: PatchProjectStore
    @EnvironmentObject private var repositoryStore: PackageRepositoryStore

    @State private var showSettings = false
    @State private var showLogs = false

    var body: some View {
        PatchProjectsView(
            onOpenSettings: {
                showSettings = true
            },
            onOpenLogs: {
                showLogs = true
            }
        )
        .tint(AppTheme.accent)
        .imageScale(.small)
        .sheet(isPresented: $showSettings) {
            SettingsView()
        }
        .sheet(isPresented: $showLogs) {
            LogView()
        }
        .patchStorePresentation(patchStore)
        .repositoryStorePresentation(repositoryStore)
    }
}
