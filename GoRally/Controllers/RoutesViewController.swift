//
//  EditViewController.swift
//  GoRally
//
//  Created by Don Wolfton on 14.08.23.
//

import Foundation
import UIKit

class RoutesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let routesTable = UITableView()

    let rallyArray = ["Rally 1", "Rally 2", "Rally 3", "Rally 4", "Rally 5",  "Rally 6",  "Rally 7",  "Rally 8",  "Rally 9",  "Rally 10", "Rally 11", "Rally 12", "Rally 13"]

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .theme
        title = "Edit"

        view.addSubview(routesTable)

        routesTable.delegate = self
        routesTable.dataSource = self

        routesTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        

        routesTable.backgroundColor = .theme

    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        routesTable.frame = view.bounds

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rallyArray.count
    }

//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = rallyArray[indexPath.row]
//        cell.textLabel?.font = .systemFont(ofSize: 26)
//        cell.textLabel?.textColor = .texts
//        cell.backgroundColor = .theme
//        return cell
//    }
//    нормально работает

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let customCell: CustomRouteCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomRouteCell
        else {
                return UITableViewCell()
            }
        customCell.backgroundColor = .systemBlue
        return customCell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("cell tapped")
    }

    func openRoute() {
        
    }

}
