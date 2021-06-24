//
//  UIViewConctroller+extension.swift
//  WeatherAppTest
//
//  Created by Anton Redkozubov on 24.06.2021.
//

import UIKit

extension ViewController {
    func presentSearchAlertController(withTitle title: String?, message: String?,
                                      style: UIAlertController.Style,
                                      completionHandler: @escaping (String) -> Void) {
        let alertController = UIAlertController(title: title, message: message
                                                , preferredStyle: style)
        alertController.addTextField{ textField in
            let cities = ["Volgograd", "Moscow", "Viena"]
            textField.placeholder = cities.randomElement()
        }
        let search = UIAlertAction(title: "Поиск", style: .default) { action in
            let textField = alertController.textFields?.first
            guard let cityName = textField?.text else { return }
            if cityName != "" {
                let city = cityName.split(separator: " ").joined(separator: "%20")
                completionHandler(cityName)
            }
        }
        let cencel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)

        alertController.addAction(search)
        alertController.addAction(cencel)
        present(alertController, animated: true, completion: nil)
    }
}
