import Foundation

extension String {
    
    var removingHTMLOccurances: String {
        self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
    
}
