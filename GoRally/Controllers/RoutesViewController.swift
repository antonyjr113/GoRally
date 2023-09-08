//
//  EditViewController.swift
//  GoRally
//
//  Created by Don Wolfton on 14.08.23.
//

import Foundation
import UIKit

class RoutesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let routesTable: UITableView = {
        let table = UITableView()
        table.backgroundColor = .theme
        table.allowsSelection = true
        table.register(RouteTableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    let rallyArray = ["Rally 1", "Rally 2", "Rally 3", "Rally 4", "Rally 5",  "Rally 6",  "Rally 7",  "Rally 8",  "Rally 9",  "Rally 10", "Rally 11", "Rally 12", "Rally 13"]

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .theme
        title = "Routes"

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

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = rallyArray[indexPath.row]
        cell.textLabel?.font = .systemFont(ofSize: 26)
        cell.backgroundColor = .theme
        return cell
    }

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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)
        let routeVC = RouteShowViewController()
        routeVC.view.backgroundColor = .theme
        routeVC.modalPresentationStyle = .pageSheet

        present(routeVC, animated: true)

    }


}
