//
//  ViewController.swift
//  WeatherAppTest
//
//  Created by Anton Redkozubov on 18.06.2021.
//

import UIKit
import SnapKit
import CoreLocation

class ViewController: UIViewController {

    var weatherData = WeatherData()
    let locationManager = CLLocationManager()

    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private lazy var detailForecastLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private lazy var celsiumNumberLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private lazy var weatherImage: UIImageView = {
        let img = UIImageView()
        return img
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        startLocationManager()
        settupUi()
    }

    func settupUi() {
        view.backgroundColor = .white

        cityLabel.textColor = .black
        cityLabel.font = cityLabel.font.withSize(20)

        detailForecastLabel.font = detailForecastLabel.font.withSize(14)
        celsiumNumberLabel.font = celsiumNumberLabel.font.withSize(30)
    }

    func updateView() {
        cityLabel.text = weatherData.name
        detailForecastLabel.text = DataSource.weatherIDs[weatherData.weather[0].id]
        celsiumNumberLabel.text = weatherData.main.temp.description
        weatherImage.image = UIImage(named: weatherData.weather[0].icon)
    }

    func startLocationManager() {
        locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            locationManager.pausesLocationUpdatesAutomatically = false
            locationManager.startUpdatingLocation()
        }
    }

    func updateWeatherInfo(latitude: Double, longtitude: Double) {
        let session = URLSession.shared
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude.description)&lon=\(longtitude.description)&appid=\(apiKey)")!
        let task = session.dataTask(with: url) { data, _, error in
            guard error == nil else {
                print("DataTask error: \(error!.localizedDescription)")
                return
            }

            do {
                self.weatherData = try JSONDecoder().decode(WeatherData.self, from: data!)
                DispatchQueue.main.async {
                    self.updateView()
                }
                print(self.weatherData)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }

    // MARK: - Constrains
    override func loadView() {
        super.loadView()

        view.addSubview(cityLabel)
        view.addSubview(detailForecastLabel)
        view.addSubview(celsiumNumberLabel)
        view.addSubview(weatherImage)

        cityLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(150)
        }

        detailForecastLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(cityLabel).offset(30)
        }

        celsiumNumberLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(detailForecastLabel).offset(50)
        }

        weatherImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(celsiumNumberLabel).offset(50)
        }
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastLocation = locations.last {
            updateWeatherInfo(latitude: lastLocation.coordinate.latitude, longtitude: lastLocation.coordinate.longitude)
        }
    }
}
