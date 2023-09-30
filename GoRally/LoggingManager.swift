//
//  LoggingManager.swift
//  GoRally
//
//  Created by Don Wolfton on 10.09.23.
//

import UIKit

struct TimeIntervalStruct {
    var distance: String = ""
    var time: String = ""
    var speed: String = ""
}



final class LoggingManager {


    let logPrefix = "Log-"

    let folderName = "GoRallyLogs"

    let date = Date()

    var fileName = ""

    //var dateForLog = String(date.timeIntervalSince1970 / (60*60*24))

    static let shared = LoggingManager()

    func createLog() {

        var dateForLog = date.logData

        let folderForLogs = try! FileManager.default
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent("\(folderName)")

        try? FileManager.default.createDirectory(at: folderForLogs, withIntermediateDirectories: true)

        print("\ndirectory is created")

        var fileURL = folderForLogs.appendingPathComponent("\(logPrefix)\(dateForLog).log")

        let pathToAppendData = fileURL.absoluteString
        let folderForLogsString = folderForLogs.absoluteString

        print(pathToAppendData)

        fileName = "\(logPrefix)\(dateForLog).log"

        print("\nfolder is created\n")

        var dataToAppend = "Test tring to write to file"
        //structConverterToString(data: data)


//        do {
//            try dataToAppend.write(to: logURL)
//        } catch {
//            print(error)
//        }
//
        self.save(text: dataToAppend, toDirectory: folderForLogsString, withFileName: pathToAppendData)
        print("success")
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

}

extension Date {
    var logData: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy-HH:mm"
        return formatter.string(from: self)
    }
}

