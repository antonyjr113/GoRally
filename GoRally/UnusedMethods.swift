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








//private func createLoginForm() {
//
//    view.addSubview(helloTitle)
//    helloTitle.snp.makeConstraints {
//        $0.centerX.equalToSuperview()
//        $0.top.equalToSuperview().offset(150)
//    }
//
//    view.addSubview(nameField)
//    nameField.font = .systemFont(ofSize: 30)
//    nameField.textColor = .texts
//    nameField.layer.borderWidth = 1
//    nameField.layer.cornerRadius = 3
//    nameField.snp.makeConstraints {
//        $0.leading.equalToSuperview().offset(15)
//        $0.trailing.equalToSuperview().offset(-15)
//        $0.top.equalToSuperview().offset(300)
//    }
//
//    view.addSubview(passwordField)
//    passwordField.font = .systemFont(ofSize: 30)
//    passwordField.textColor = .texts
//    passwordField.layer.borderWidth = 1
//    passwordField.layer.cornerRadius = 3
//    passwordField.snp.makeConstraints {
//        $0.leading.equalToSuperview().offset(15)
//        $0.trailing.equalToSuperview().offset(-15)
//        $0.top.equalToSuperview().offset(400)
//    }
//
//    view.addSubview(loginButton)
//    loginButton.snp.makeConstraints {
//        $0.centerX.equalToSuperview()
//        $0.bottom.equalToSuperview().offset(-50)
//        $0.width.equalTo(100)
//        $0.height.equalTo(50)
//    }
//    loginButton.layer.cornerRadius = 25
//    loginButton.addTarget(self, action: #selector(loginButtonTap), for: .touchUpInside)
//}
