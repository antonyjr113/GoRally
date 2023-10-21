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
        let currentRoute = routesStruct[indexPath.row]
        cell.textLabel?.text = currentRoute.route
        cell.textLabel?.font = .systemFont(ofSize: 28, weight: .semibold)
        cell.textLabel?.textColor = .texts
        cell.backgroundColor = .theme
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let element = routesStruct[indexPath.row]
        let currentRouteLink = element.link
        let routeVC = RouteShowViewController(routeLink: currentRouteLink ?? "")
        routeVC.view.backgroundColor = .theme
        routeVC.modalPresentationStyle = .pageSheet
        present(routeVC, animated: true)
        
    }
    
    
}
