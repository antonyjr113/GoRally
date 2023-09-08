//
//  RouteModel.swift
//  GoRally
//
//  Created by Don Wolfton on 5.09.23.
//

import Foundation
import UIKit
import PDFKit

struct RouteStruct {
    let distance: String = ""
    let time: String = ""
    let direct: String = ""
    let recomend: String = ""
    let controll: String = ""
}

struct RoutePDF {
    let doc = PDFDocument()
}


final class RouteManager {

    static let shared = RouteManager()

    private var routeHolder: [RoutePDF] = []

    func addRoute(_ route: RoutePDF) {
        routeHolder.append(route)
    }
    
}
