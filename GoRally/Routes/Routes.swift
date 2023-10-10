//
//  Routes.swift
//  GoRally
//
//  Created by Don Wolfton on 3.10.23.
//

import UIKit

struct RouteAndLinkStruct {
    let route: String?
    let link: String?
}

let belaruchi = RouteAndLinkStruct(route: "Rally Belaruchi", link: "https://sgonay.com.pl/arc/roadbooks/roadbook_R1_23.pdf")
let haradzische = RouteAndLinkStruct(route: "Rally Haradzische", link: "https://sgonay.com.pl/arc/roadbooks/roadbook_R1_22.pdf")
let starayaRudnia = RouteAndLinkStruct(route: "Rally Staraya Rudnya", link: "https://sgonay.com.pl/arc/roadbooks/roadbook_R2_22.pdf")
let tarasiki = RouteAndLinkStruct(route: "Rally Tarasiki", link: "https://sgonay.com.pl/arc/roadbooks/roadbook_R5_23.pdf")
let vileyka = RouteAndLinkStruct(route: "Rally Vileyka", link: "https://sgonay.com.pl/arc/roadbooks/roadbook_R2_23.pdf")

let rallyArray = ["Rally Belaruchi", "Rally Haradzische", "Rally Staraya Rudnya", "Rally Tarasiki", "Rally Vileyka"]

let routesLinks = ["https://sgonay.com.pl/arc/roadbooks/roadbook_R1_23.pdf", "https://sgonay.com.pl/arc/roadbooks/roadbook_R1_22.pdf", "https://sgonay.com.pl/arc/roadbooks/roadbook_R2_22.pdf", "https://sgonay.com.pl/arc/roadbooks/roadbook_R5_23.pdf", "https://sgonay.com.pl/arc/roadbooks/roadbook_R2_23.pdf"]

let routesDict = ["Rally Belaruchi":"https://sgonay.com.pl/arc/roadbooks/roadbook_R1_23.pdf",
                  "Rally Haradzische":"https://sgonay.com.pl/arc/roadbooks/roadbook_R1_22.pdf",
                  "Rally Staraya Rudnya":"https://sgonay.com.pl/arc/roadbooks/roadbook_R2_22.pdf",
                  "Rally Tarasiki":"https://sgonay.com.pl/arc/roadbooks/roadbook_R5_23.pdf",
                  "Rally Vileyka":"https://sgonay.com.pl/arc/roadbooks/roadbook_R2_23.pdf"]


let routesStruct = [belaruchi, haradzische, starayaRudnia, tarasiki, vileyka]
