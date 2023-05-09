import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
    static let launchTheme = LaunchTheme()
}

// Set colors for entire app.
struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondaryText = Color("SecondaryTextColor")
}

// Set colors for launch screen.
struct LaunchTheme {
    let accent = Color("LaunchAccentColor")
    let background = Color("LaunchBackgroundColor")
}
