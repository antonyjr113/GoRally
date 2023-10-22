//
//  LoggingManager.swift
//  GoRally
//
//  Created by Don Wolfton on 10.09.23.
//

import UIKit
import SwiftyBeaver

struct TimeIntervalStruct {
    var distance: String = ""
    var time: String = ""
    var speed: String = ""
}

final class LoggingManager: TextOutputStream {

    func write(_ string: String) {
        let appendString = string.unicodeScalars.lazy.map { scalar in
            scalar == "\n"
            ? "\n"
            : scalar.escaped(asASCII: true)
        }
    }

    private static var onceFlag = true
    
    let logPrefix = "Log-"
    
    let mainDirectoryName = "GoRally"

    let folderForLogsName = "logs"
    
    let date = Date()
    
    var fileName = ""
    
    static let shared = LoggingManager()

    var logStr = ""
    
    func createLog() {
        
        var dateForLog = date.logData
        
        let folder = try! FileManager.default
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent("\(mainDirectoryName)")

        //print("success - folder in document directiry created")
        print(folder.absoluteString)

        try? FileManager.default.createDirectory(at: folder, withIntermediateDirectories: true)

        var mainFolderURL = folder.appendingPathComponent(folderForLogsName)
        
        //print("\ndirectory is created")
        //print(mainFolderURL.absoluteString)


        let filePath = folder.absoluteString + "log-\(dateForLog).txt"
        FileManager.default.createFile(atPath: mainFolderURL.absoluteString, contents: nil)
        //print("file is created ")
        //print(filePath)

        let dataToAppend = "Test tring to write to file\n"

        do {
            try dataToAppend.write(toFile: filePath, atomically: true, encoding: .utf8)

        } catch {
            print(error)
        }

//        let pathToAppendData = folder.absoluteString
//        let folderForLogsString = mainFolderURL.absoluteString
//        let toFolder = folder.absoluteString
//
//        print("where to save = ", pathToAppendData)
//
//        fileName = "\(logPrefix)\(dateForLog).log"
//
//        print("\nfolder is created\n")
//
//
//        self.save(text: dataToAppend, toDirectory: toFolder, withFileName: pathToAppendData)
//        print("success")
    }
    
    private func append(toPath path: String,
                        withPathComponent pathComponent: String) -> String? {
        if var pathURL = URL(string: path) {
            pathURL.appendPathComponent(pathComponent)
            
            return pathURL.absoluteString
        }
        return nil
    }
    
    func save(text: String,
              toDirectory directory: String,
              withFileName fileName: String) {
        guard let filePath = self.append(toPath: directory,
                                         withPathComponent: fileName) else {
            return
        }
        do {
            try text.write(toFile: filePath,
                           atomically: true,
                           encoding: .utf8)
        } catch {
            print("Error", error)
            return
        }
        print("Save successful")
    }
    
    func structConverterToString(data: TimeIntervalStruct) -> String {
        let newNoteToLog: String =
                            """
                            \(data.distance)
                            \(data.speed)
                            \(data.time)
                            """
        return newNoteToLog
    }

        public static func configure(maxFilesCount: Int = 100, logsFolderName: String = "logs") {
            guard onceFlag else { return }
            let console = ConsoleDestination()
            let file = FileDestination()
            #if targetEnvironment(simulator)
            console.asynchronously = false
            console.minLevel = .verbose
            console.format = "$DHH:mm:ss.SSS$d $C$L$c $N.$F:$l - $M $X"
            file.minLevel = .verbose
            file.format = "$DHH:mm:ss.SSS$d $C$L$c $N.$F:$l - $M"
            file.asynchronously = false
            let thisFile = URL(fileURLWithPath: #filePath)
            let folderURL = thisFile.deletingLastPathComponent()
            self.checkFilesCount(
                folderPath: folderURL.path,
                maxFilesCount: maxFilesCount * 3
            )
            let fileURL = folderURL.appendingPathComponent("Logs/app-log-\(Date().logData).log")
            let path = fileURL.path
            self.checkFilesCount(
                folderPath: folderURL.path,
                maxFilesCount: maxFilesCount * 3
            )
            file.logFileURL = URL(fileURLWithPath: path)
            let destinations: [BaseDestination] = [console, file]
            #else
            #if DEBUG
            console.asynchronously = true
            console.minLevel = .verbose
            console.format = "$DHH:mm:ss.SSS$d $C$L$c $N.$F:$l - $M $X"
            file.minLevel = .verbose
            file.format = "$DHH:mm:ss.SSS$d $C$L$c $N.$F:$l - $M"
            file.asynchronously = true
            let folderURL = FileManager.default.documentDirectory
            let fileURL = folderURL.appendingPathComponent("Logs/app-log-\(Date().logData).log")
            let path = fileURL.path
            self.checkFilesCount(
                folderPath: folderURL.appendingPathComponent("Logs").path,
                maxFilesCount: maxFilesCount
            )
            file.logFileURL = URL(fileURLWithPath: path)
            let destinations: [BaseDestination] = [console, file]
            #else
            let destinations: [BaseDestination] = []
            #endif
            #endif
            destinations.forEach({ SwiftyBeaver.self.addDestination($0) })
            onceFlag = false
        }

    private static func checkFilesCount(folderPath: String, maxFilesCount: Int) {
            do {
                let directoryContent = try FileManager.default.contentsOfDirectory(atPath: folderPath)
                if directoryContent.count > maxFilesCount {
                    var files: [Date: String] = [:]
                    directoryContent.forEach { (fileName) in
                        let filePath = URL(fileURLWithPath: folderPath).appendingPathComponent(fileName).path
                        if let attributes = try? FileManager.default.attributesOfItem(atPath: filePath) {
                            if let createDate = attributes[FileAttributeKey.creationDate] as? Date {
                                files.updateValue(filePath, forKey: createDate)
                            }
                        }
                    }
                    let keysToDelete = Array(files.keys.sorted(by: > ).suffix(from: maxFilesCount))
                    keysToDelete.forEach { (date) in
                        if let path = files[date] {
                            if !FileManager.default.fileExists(atPath: path) {
                                assertionFailure()
                            }
                            do {
                                try FileManager.default.removeItem(at: URL(fileURLWithPath: path))
                            } catch {
                                SwiftyBeaver.self.custom(level: .error, message: error.localizedDescription)
                            }
                        }
                    }
                }
            } catch {
                SwiftyBeaver.self.custom(level: .error, message: error.localizedDescription)
            }
        }
}
    
//}

extension Date {
    var logData: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy-HH:mm"
        return formatter.string(from: self)
    }
}

extension FileManager {
    var documentDirectory: URL {
        return self.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}

