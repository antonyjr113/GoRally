//
//  UserDefaultsManageer.swift
//  GoRally
//
//  Created by Don Wolfton on 10.09.23.
//

import UIKit

//struct DetectLaunch {
//    static let keyforLaunch = "validateFirstlunch"
//    static var isFirst: Bool {
//        get {
//            return UserDefaults.standard.bool(forKey: keyforLaunch)
//        }
//        set {
//            UserDefaults.standard.set(newValue, forKey: keyforLaunch)
//        }
//    }
//}
var isFirstLaunch: Bool?

extension UserDefaults {

    func saveTeamData(name: String, pass: String) {
        UserDefaults.standard.set(name, forKey: "teamNameEntered")
        UserDefaults.standard.set(pass, forKey: "teamPassEntered")
    }

    func changeFirstLaunchValue() {
        isFirstLaunch = false
    }
}
