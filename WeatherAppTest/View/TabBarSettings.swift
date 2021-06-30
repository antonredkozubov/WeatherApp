//
//  TabBarSettings.swift
//  WeatherAppTest
//
//  Created by Anton Redkozubov on 24.06.2021.
//

import UIKit

class TabBarSettings: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let mainWeather = ViewController()
        mainWeather.tabBarItem = UITabBarItem(title: "Главная", image: UIImage.mainTab, tag: 0)
        let listShopsNav = UINavigationController(rootViewController: mainWeather)

        let dailyForecast = DailyForecastViewController()
        dailyForecast.tabBarItem = UITabBarItem(title: "Погода", image: UIImage.dailyTab, tag: 1)

        let tabBarList = [listShopsNav, dailyForecast]

        viewControllers = tabBarList
        // Do any additional setup after loading the view.

        let vcTab0 =
            UINavigationController(rootViewController: ViewController())
        let vcTab1 =
            UINavigationController(rootViewController: DailyForecastViewController())

        vcTab0.tabBarItem = UITabBarItem(title: "Главная", image: UIImage.mainTab, tag: 0)
        vcTab1.tabBarItem = UITabBarItem(title: "Погода", image: UIImage.dailyTab, tag: 1)

        viewControllers = [vcTab0,
                           vcTab1]
        self.selectedIndex = 0

    }

}
