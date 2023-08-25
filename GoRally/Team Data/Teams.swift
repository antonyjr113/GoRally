//
//  Teams.swift
//  GoRally
//
//  Created by Don Wolfton on 15.08.23.
//

import Foundation

enum TeamNames {
    static let anton = "86"
    static let vlad = "33"
}

enum Passwords {
    static let anton = "1408"
    static let vlad = "1986"

}

let teamsArray = ["86", "33"]
let passwordsArray = ["1408", "1986"]

//let dictTeams: [String : String] = ["86" : "1408", "33" : "1986"]

let teamsArrayStruct = [team86, team33]

struct Team {
    var teamName: String
    var teamPass: String
}

let team86 = Team(teamName: "86", teamPass: "4786")
let team33 = Team(teamName: "33", teamPass: "5833")


