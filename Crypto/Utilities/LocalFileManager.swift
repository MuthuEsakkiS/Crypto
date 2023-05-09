import Foundation
import SwiftUI

class LocalFileManager {
    
    static let instance = LocalFileManager()
    private init() {}
    
    func saveImage(image: UIImage, imageName: String, folderName: String) {
        createFolderIfNeeded(folderName: folderName)
        guard
            let data = image.pngData(),
            let url = getImageURL(folderName: folderName, imageName: imageName) else {
            return
        }
        
        do {
            try data.write(to: url)
        } catch let error {
            print("Unable to save an image in the file manager: \(error).")
        }
    }
    
    func getImage(imageName: String, folderName: String) -> UIImage? {
        guard
            let url = getImageURL(folderName: folderName, imageName: imageName),
            FileManager.default.fileExists(atPath: url.path()) else { return nil }
        return UIImage(contentsOfFile: url.path())
    }
    
    private func createFolderIfNeeded(folderName: String) {
        guard let url = getURLForFolder(folderName: folderName) else { return }
        if !FileManager.default.fileExists(atPath: url.path()) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
            } catch let error {
                print("Unable to create a folder: \(error)")
            }
        }
    }
    
    private func getURLForFolder(folderName: String) -> URL? {
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else { return nil }
        return url.appendingPathComponent(folderName, conformingTo: .folder)
    }
    
    private func getImageURL(folderName: String, imageName: String) -> URL? {
        guard let url = getURLForFolder(folderName: folderName)?.appendingPathComponent(imageName, conformingTo: .png) else { return nil }
        return url
    }
}
