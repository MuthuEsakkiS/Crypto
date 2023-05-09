import Foundation

struct SettingsViewModel {
    
    let coinGeckoURL = URL(string: "https://www.coingecko.com")!
    let githubURL = URL(string: "https://github.com/MuthuEsakkiS")!
    let defaultURL = URL(string: "https://www.google.com")!
    let coinGeckoDescription: String = "The cryptocurrency data that is used in this app comes from a free API from CoinGecko! Prices may be slightly delayed."
    let developerDescription: String = "This app was developed by Esakkimuthu. It uses SwiftUI and is written 100% in Swift. The project benefits from multi-threading, publishers/subscribers, and data persistance."
    
}
