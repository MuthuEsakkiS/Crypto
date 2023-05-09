import SwiftUI

struct SettingsView: View {
    
    private let viewModel: SettingsViewModel = SettingsViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color.theme.background
                    .ignoresSafeArea()
                
                List {
                    coinGeckoSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    DeveloperSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    ApplicationSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                }
            }
            .font(.headline)
            .tint(.blue)
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    DismissButton()
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

extension SettingsView {
    
    private var coinGeckoSection: some View {
        Section {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text(viewModel.coinGeckoDescription)
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(.theme.accent)
            }
            .padding(.vertical)
            Link("Visit CoinGecko 🦎", destination: viewModel.coinGeckoURL)
        } header: {
            Text("CoinGecko")
        }

    }
    
    private var DeveloperSection: some View {
        Section {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text(viewModel.developerDescription)
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(.theme.accent)
            }
            .padding(.vertical)
            Link("Visit Github", destination: viewModel.githubURL)
        } header: {
            Text("Developer")
        }

    }
    
    private var ApplicationSection: some View {
        Section {
            Link("Terms of Service", destination: viewModel.defaultURL)
            Link("Privacy and Policy", destination: viewModel.defaultURL)
        } header: {
            Text("Application")
        }

    }
}
