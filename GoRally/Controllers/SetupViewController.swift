//
//  SetupViewController.swift
//  GoRally
//
//  Created by Don Wolfton on 14.08.23.
//

import Foundation
import UIKit

class SetupViewController: UIViewController {

    let logoutButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemRed
        button.setTitle("Log Out", for: .normal)
        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .theme
        title = "Setup"

        view.addSubview(logoutButton)
        logoutButton.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(50)
        }
        logoutButton.layer.cornerRadius = 25
        logoutButton.addTarget(self, action: #selector(logoutButtonTap), for: .touchUpInside)
    }

    @objc func logoutButtonTap() {

        let alert = UIAlertController(title: "Log out", message: "Do you want to log out?", preferredStyle: .actionSheet)

        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {action in
            self.dismiss(animated: false)
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))

        self.present(alert, animated: true)


    }


}
