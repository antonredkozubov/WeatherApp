//
//  TabBarSettings.swift
//  WeatherAppTest
//
//  Created by Anton Redkozubov on 24.06.2021.
//

import UIKit

typealias Tabs = (
    main: UIViewController,
    daily: UIViewController
)

class TabBarSettings: UITabBarController {

    init(tabs: Tabs) {
        super.init(nibName: nil, bundle: nil)
        viewControllers = [tabs.main, tabs.daily]

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.barTintColor = .white
        tabBar.tintColor = .black
    }
}

extension TabBarSettings {

    func tabs(submodules: Tabs) -> Tabs {

        let mainTabBarItem = UITabBarItem(title: "Main",
                                          image: .add,
                                          selectedImage: .add)

        let dailyTabBarItem = UITabBarItem(title: "Daily",
                                           image: .checkmark,
                                           selectedImage: nil)

        submodules.main.tabBarItem = mainTabBarItem
        submodules.daily.tabBarItem = dailyTabBarItem

        return (
            main: submodules.main,
            daily: submodules.daily
        )
    }
}
