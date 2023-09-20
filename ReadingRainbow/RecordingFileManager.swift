//
//  RecordingFileManager.swift
//  ReadingRainbow
//
//  Created by Ami Smith on 8/19/23.
//

import Foundation

extension FileManager {
    static var documentDirectory: URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask) [0]
    }
    static func renameFileInDocumentsDirectory(from name: String, to newName: String) -> URL? {
        let originPath = documentDirectory.appendingPathComponent(name)
        let fileType = name.split(separator: ".").last!
        let destinationPath = documentDirectory.appendingPathComponent(newName + ".\(fileType)")
        do {
            try FileManager.default.moveItem(at: originPath, to: destinationPath)
            return destinationPath
        } catch {
            print("Failed to rename file with error: \(error)")
            return nil
        }
    }
}


