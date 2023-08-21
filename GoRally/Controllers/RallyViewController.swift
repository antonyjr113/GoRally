//
//  RallyViewController.swift
//  GoRally
//
//  Created by Don Wolfton on 14.08.23.
//

import Foundation
import UIKit
import CoreLocation

class RallyViewController: UIViewController {

    var tapOnStart = 0

    private lazy var locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        manager.startUpdatingLocation()
        return manager
    }()

    let directionView: UIImageView = {
        let direct = UIImageView()
        direct.backgroundColor = .systemGray2
        return direct
    }()

    lazy var speedField: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        label.textColor = .texts
        label.layer.borderWidth = 1
        label.backgroundColor = .white
        return label
    }()

    lazy var distanceField: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        label.textColor = .texts
        label.layer.borderWidth = 1
        label.backgroundColor = .white
        return label
    }()

    lazy var timerField: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        label.textColor = .texts
        label.layer.borderWidth = 1
        label.backgroundColor = .white
        return label
    }()

    let startButton: UIButton = {
        let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.backgroundColor = .blue
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor =  .theme
        title = "Rally"

        view.addSubview(speedField)
        speedField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(330)
            $0.leading.equalTo(15)
            $0.trailing.equalTo(-15)
            $0.width.equalTo(200)
            $0.height.equalTo(50)
        }

        view.addSubview(distanceField)
        distanceField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(430)
            $0.leading.equalTo(15)
            $0.trailing.equalTo(-15)
            $0.width.equalTo(200)
            $0.height.equalTo(50)
        }

        view.addSubview(timerField)
        timerField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(530)
            $0.leading.equalTo(15)
            $0.trailing.equalTo(-15)
            $0.width.equalTo(200)
            $0.height.equalTo(50)
        }

        view.addSubview(startButton)
        startButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-110)
            $0.width.equalTo(100)
            $0.height.equalTo(50)
        }
        startButton.layer.cornerRadius = 25
        startButton.addTarget(self, action: #selector(startButtonTap), for: .touchUpInside)

        view.addSubview(directionView)
        directionView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(100)
            $0.width.equalTo(150)
            $0.height.equalTo(150)
        }
        
    }

    @objc private func startButtonTap() {
        tapOnStart += 1
        speedField.text = "200kmh"
        distanceField.text = "3.54km"
        timerField.text = "0:00:00"
        directionView.image = UIImage(named: "turn_right")
        startButton.backgroundColor = .systemRed
        startButton.setTitle("Stop", for: .normal)
        if tapOnStart == 2 {
            startButton.backgroundColor = .blue
            startButton.setTitle("Start", for: .normal)
            speedField.text = "0"
            distanceField.text = "0"
            timerField.text = "0"
            tapOnStart = 0
        }
    }
}

extension RallyViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coordinate = manager.location?.coordinate {
            print(coordinate.latitude)
            print(coordinate.longitude)
        }
    }
}
