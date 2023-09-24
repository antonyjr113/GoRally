//
//  RallyViewController.swift
//  GoRally
//
//  Created by Don Wolfton on 14.08.23.
//

import UIKit
import CoreLocation

class RallyViewController: UIViewController {

    var tapOnStart = 0

    var stopwatch: Timer?

    var seconds = 0

    var startStopwatch = Bool()

    var startLatitude: CLLocationDegrees?
    var startLongitude: CLLocationDegrees?
    var startLocationPoint = CLLocationCoordinate2D()

    private lazy var locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        manager.startUpdatingLocation()
        return manager
    }()

    let directionView: UILabel = {
        //let direct = UIImageView()
        let direct = UILabel()
        direct.backgroundColor = .systemGray2
        return direct
    }()

    lazy var speedFieldTitle: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        label.textColor = .texts
        label.backgroundColor = .theme
        return label
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

        view.addSubview(speedFieldTitle)
        speedFieldTitle.snp.makeConstraints {
            $0.top.equalTo(220)
            $0.leading.equalTo(15)
            $0.trailing.equalTo(-15)
            $0.width.equalTo(200)
        }

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
            $0.width.equalTo(200)
            $0.height.equalTo(100)
        }

        locationManager.requestWhenInUseAuthorization()

        locationManager.startUpdatingLocation()

        guard let startLatitude = locationManager.location?.coordinate.latitude
        else {
            return
        }
        guard let startLongitude = locationManager.location?.coordinate.longitude
        else {
            return
        }
        startLocationPoint = CLLocationCoordinate2D(latitude: startLatitude, longitude: startLongitude)
        
    }

    @objc private func startButtonTap() {

        tapOnStart += 1

        if tapOnStart == 1 {
            speedField.text = ""
            distanceField.text = "\(String(describing: locationManager.location))"
            stopwatchStart()

            //directionView.image = UIImage(named: "turn_right")
            startButton.backgroundColor = .systemRed
            startButton.setTitle("Stop", for: .normal)
        } else {
            startButton.backgroundColor = .blue
            startButton.setTitle("Start", for: .normal)
            speedField.text = "0"
            distanceField.text = "0"
            tapOnStart = 0
            resetStopwatch()
            seconds = 0
        }
    }


    private func stopwatchStart() {
        stopwatch = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(startCount), userInfo: nil, repeats: true)
//        while stopwatch != nil {
//            showDistnaceAndSpeed()
//        }

    }

    @objc private func startCount() {
        seconds = seconds + 1
        let time = convertSecondsToTime(seconds: seconds)
        let timeString = showTimeInString(hours: time.0, minutes: time.1, seconds: time.2)
        timerField.text = timeString
        showDistnaceAndSpeed()

    }

    private func convertSecondsToTime(seconds: Int) -> (Int, Int, Int) {
        return ((seconds / 3600), ((seconds % 3600) / 60), ((seconds % 3600) % 60))
    }

    private func resetStopwatch() {
            stopwatch?.invalidate()
            stopwatch = nil
            timerField.text = showTimeInString(hours: 0, minutes: 0, seconds: 0)
    }

    private func showTimeInString(hours: Int, minutes: Int, seconds: Int) -> String {

        var timeString = ""

        timeString += String(format: "0%2d", hours)
        timeString += " : "

        if minutes < 10 {
            timeString += String(format: "0%d", minutes)
        } else {
            timeString += String(format: "%d", minutes)
        }
        timeString += " : "

        if seconds < 10 {
            timeString += String(format: "0%d", seconds)
        } else {
            timeString += String(format: "%d", seconds)
        }

        return timeString

    }

    private func showDistnaceAndSpeed() {

        guard var nextPointLatitude = locationManager.location?.coordinate.latitude
        else {
            return
        }

        guard var nextPointLongitude = locationManager.location?.coordinate.longitude
        else {
            return
        }

        var nextLocationPoint = CLLocationCoordinate2D(latitude: nextPointLatitude, longitude: nextPointLongitude)

        var distance = (nextLocationPoint.distance(to: startLocationPoint) / 1000)

        distanceField.text = String(distance)
        distanceField.textColor = .purple

        var currentSpeed = Int(distance) / (seconds + 1) //фикс временный - крэшило из-за деления на 0

        speedField.text = String(currentSpeed)
        speedField.textColor = .orange
    }
}

extension RallyViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coordinate = manager.location?.coordinate {
            print(coordinate.latitude)
            directionView.text = "\(coordinate.latitude)\n\(coordinate.longitude)"
            print(coordinate.longitude)
        }
    }
}

extension CLLocationCoordinate2D {

    func distance(to: CLLocationCoordinate2D) -> CLLocationDistance {
        CLLocation(latitude: latitude, longitude: longitude)
            .distance(from: CLLocation(latitude: to.latitude, longitude: to.longitude))
    }

}


