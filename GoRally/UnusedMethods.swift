//
//  UnusedMethods.swift
//  GoRally
//
//  Created by Don Wolfton on 1.10.23.
//

import Foundation

// -------------login functions--------------

//enum TeamNames {
//    static let anton = "86"
//    static let vlad = "33"
//}
//
//enum Passwords {
//    static let anton = "1408"
//    static let vlad = "1986"
//
//}
//
//
//let teamsArrayStruct = [team33, team86]
//
//struct Team {
//    var teamName: String
//    var teamPass: String
//}
//
//let team86 = Team(teamName: "86", teamPass: "4786")
//let team33 = Team(teamName: "33", teamPass: "5833")

//        for element in teamsArrayStruct {
//
//            if element.teamName == userData.teamName && element.teamPass == userData.teamPass {
//                createTabBar()
//                nameField.text = nil
//                passwordField.text = nil
//                userDefaults.set(userData.teamName, forKey: "teamNameEntered")
//                userDefaults.set(userData.teamPass, forKey: "teamPassEntered")
//
//                print(userDefaults.object(forKey: "teamNameEntered"))
//
//                print(userDefaults.object(forKey: "teamPassEntered"))
//
//            } else {
//
//                let alert = UIAlertController(title: "Error", message: "Incorrect data! Try to rewrite your team name and password :)", preferredStyle: .alert)
//
//                alert.addAction(UIAlertAction(title: "Try again", style: .cancel, handler: nil))
//
//                self.present(alert, animated: true)
//            }
//        }


//    private func checkLogin() {
//
//        if teamsArray.contains(nameField.text ?? "") && passwordsArray.contains(passwordField.text ?? "") {
//            createTabBar()
//            nameField.text = nil
//            passwordField.text = nil
//
//        } else {
//
//            let alert = UIAlertController(title: "Error", message: "Incorrect data!", preferredStyle: .alert)
//
//            alert.addAction(UIAlertAction(title: "Try again", style: .cancel, handler: nil))
//
//            self.present(alert, animated: true)
//        }
//    }


//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        tableView.deselectRow(at: indexPath, animated: true)
//
//        let routeVC = UIViewController()
//        routeVC.view.backgroundColor = .theme
//        routeVC.modalPresentationStyle = .pageSheet
//
//        let routeVCTitle = UILabel()
//        routeVCTitle.text = rallyArray[indexPath.row]
//
//        routeVC.view.addSubview(routeVCTitle)
//        routeVCTitle.textAlignment = .center
//        routeVCTitle.textColor = .texts
//        routeVCTitle.font = .systemFont(ofSize: 30)
//
//        routeVCTitle.snp.makeConstraints {
//            $0.top.equalTo(30)
//            $0.width.equalToSuperview().offset(15)
//            $0.height.equalTo(40)
//        }
//        present(routeVC, animated: true)
//    }


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
