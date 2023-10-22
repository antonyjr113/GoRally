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

    var secondsForSpeed = 0

    var startStopwatch = Bool()

    var currentData = TimeIntervalStruct()

    var logString = ""

    var startLatitude: CLLocationDegrees?
    var startLongitude: CLLocationDegrees?
    var startLocationPoint = CLLocationCoordinate2D()
    var startLocationPointCL = CLLocation()

    private lazy var locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        //manager.startUpdatingLocation()
        return manager
    }()

    lazy var speedFieldTitle: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 35))
        label.textColor = .texts
        label.text = "Speed - km/h"
        label.font = .boldSystemFont(ofSize: 21)
        label.backgroundColor = .theme
        return label
    }()

    lazy var speedField: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        label.textColor = .texts
        label.text = "you"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 72)
        label.layer.borderWidth = 0
        label.backgroundColor = .white
        return label
    }()

    lazy var distanceFieldTitle: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 35))
        label.textColor = .texts
        label.text = "Distance - km"
        label.font = .boldSystemFont(ofSize: 21)
        label.backgroundColor = .theme
        return label
    }()

    lazy var distanceField: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        label.textColor = .texts
        label.text = "Ready?"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 72)
        label.layer.borderWidth = 0
        label.backgroundColor = .white
        return label
    }()

    lazy var timerFieldTitle: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 35))
        label.textColor = .texts
        label.text = "Time"
        label.font = .boldSystemFont(ofSize: 21)
        label.backgroundColor = .theme
        return label
    }()

    lazy var timerField: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        label.textColor = .texts
        label.text = "Are"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 62)
        label.layer.borderWidth = 0
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

        view.addSubview(timerFieldTitle)
        timerFieldTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(110)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(30)
        }

        view.addSubview(timerField)
        timerField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(140)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
            $0.height.equalTo(140)
        }

        view.addSubview(speedFieldTitle)
        speedFieldTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(310)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(30)
        }

        view.addSubview(speedField)
        speedField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(340)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
            $0.height.equalTo(140)
        }

        view.addSubview(distanceFieldTitle)
        distanceFieldTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(510)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(30)
        }

        view.addSubview(distanceField)
        distanceField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(540)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
            $0.height.equalTo(140)
        }

        view.addSubview(startButton)
        startButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-100)
            $0.width.equalTo(100)
            $0.height.equalTo(50)
        }

        startButton.layer.cornerRadius = 25
        startButton.addTarget(self, action: #selector(startButtonTap), for: .touchUpInside)

        locationManager.requestWhenInUseAuthorization()

        guard let startLatitude = locationManager.location?.coordinate.latitude
        else {
            return
        }
        guard let startLongitude = locationManager.location?.coordinate.longitude
        else {
            return
        }
        print("start point lat", startLatitude)
        print("start point long", startLongitude)
        startLocationPointCL = CLLocation(latitude: startLatitude, longitude: startLongitude)
    }

    @objc private func startButtonTap() {

        tapOnStart += 1

        LoggingManager.shared.createLog()

        if tapOnStart == 1 {
            speedField.text = "GO!"
            distanceField.text = "GO!"
            timerField.text = "GO!"
            stopwatchStart()
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
            print(logString)
            LoggingManager.shared.logStr = logString
        }
    }

    private func stopwatchStart() {
        stopwatch = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(startCount), userInfo: nil, repeats: true)
    }

    @objc private func startCount() {

        seconds = seconds + 1
        secondsForSpeed = seconds + 1
        print("current second = ", secondsForSpeed)
        let time = convertSecondsToTime(seconds: seconds)
        let timeString = showTimeInString(hours: time.0, minutes: time.1, seconds: time.2)
        timerField.text = timeString
        if seconds >= 1 {
            showDistnaceAndSpeed()
        }
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

        timeString += String(format: "0%d", hours)
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

        locationManager.startUpdatingLocation()

        print("startPoint :", startLocationPointCL)

        guard var nextPointLatitude = locationManager.location?.coordinate.latitude
        else {
            return
        }

        guard var nextPointLongitude = locationManager.location?.coordinate.longitude
        else {
            return
        }

        var nextLocationPoint = CLLocation(latitude: nextPointLatitude, longitude: nextPointLongitude)

        print("next point : ", nextLocationPoint)

        var distance = nextLocationPoint.distance(from: startLocationPointCL)

        print ("\nCL Speed = ", nextLocationPoint.speed)

        if seconds >= 1 {
            var convertedDistanceToKM = ((distance / 1000.0) * 1.21)
            distanceField.text = String(format: "%.2f", convertedDistanceToKM)
            distanceField.textColor = .purple

            currentData.distance = String(distance)

            print("\ndistance = ", distance)

            var hours: Double = Double(seconds / 3600)

            var currentSpeed = 0.0
            print("seconds = ", seconds)
            print("hours = ", hours)

            if seconds > 0 {
                print(true)
                currentSpeed = ((Double(distance * 1.21) / Double(seconds)))
                print("speed m/s = ", currentSpeed)
            } else {
                print(false)
                currentSpeed = 0
            }
            speedField.text = String(format: "%.1f", (currentSpeed / 0.278))
            //speedField.text = String(format: "%.0f", (currentSpeed * 1000 / 3600))
            print("speed km/h = ", (currentSpeed / 0.278))
            speedField.textColor = .orange

            currentData.speed = String(currentSpeed)

            logString.append("\n\ntime = \(timerField.text!)\ncoordinate lat = \(nextPointLatitude)\ncoordinate long = \(nextPointLongitude)\ndistance = \(convertedDistanceToKM)\nspeed = \(currentSpeed)")
        }
    }
}

extension RallyViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coordinate = manager.location?.coordinate {
//            print(coordinate.latitude)
//            print(coordinate.longitude)
        }
    }
}



