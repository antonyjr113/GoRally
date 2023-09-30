//
//  RouteTableView.swift
//  GoRally
//
//  Created by Don Wolfton on 6.09.23.
//

import UIKit

final class RouteTableView : UIView {

    let cell = RouteTableViewCell()

    let distanceLabel = UILabel()
    let directLabel = UILabel()
    let timePointLable = UILabel()
    let recomendLabel = UILabel()
    let alertLabel = UILabel()

    func createCellFromFile(distance: String, direct: String, recomend: String, controll: String, time: String) {

        distanceLabel.text = distance
        directLabel.text = direct
        recomendLabel.text = recomend
        alertLabel.text = controll

        var cellStack = UIStackView()

        cellStack.axis = .horizontal

        cellStack.addArrangedSubview(distanceLabel)
        cellStack.addArrangedSubview(directLabel)
        cellStack.addArrangedSubview(timePointLable)
        cellStack.addArrangedSubview(recomendLabel)
        cellStack.addArrangedSubview(alertLabel)

        cell.addSubview(cellStack)
    }
}
