//
//  ViewController.swift
//  GoRally
//
//  Created by Don Wolfton on 14.08.23.
//

import UIKit
import SnapKit

class ViewController: UIViewController, AvoidingKeyboard, HideKeyboardWhenTappedAround {

    let helloTitle: UILabel = {
        let label = UILabel()
        label.text = "Let's race!"
        label.textColor = .texts
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 32)
        return label
    }()

    /// login button
    let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = .blue
        return button
    }()

    /// name team field
    let nameField: UITextField = {
        let name = UITextField()
        name.backgroundColor = .white
        //name.placeholder = "Enter team name"
        name.attributedPlaceholder = NSAttributedString(
            string: "Enter team name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.texts]
        )
        return name
    }()

    /// password team filed
    let passwordField: UITextField = {
        let pass = UITextField()
        pass.backgroundColor = .white
        //pass.placeholder = "Enter password"
        pass.attributedPlaceholder = NSAttributedString(
            string: "Enter password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.texts]
        )
        return pass
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        hideKeyboardWhenTappedAround()

        view.backgroundColor = .theme

        view.addSubview(helloTitle)
        helloTitle.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(150)
        }

        view.addSubview(nameField)
        nameField.font = .systemFont(ofSize: 30)
        nameField.textColor = .texts
        nameField.layer.borderWidth = 1
        nameField.layer.cornerRadius = 3
        nameField.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().offset(-15)
            $0.top.equalToSuperview().offset(300)
        }

        view.addSubview(passwordField)
        passwordField.font = .systemFont(ofSize: 30)
        passwordField.textColor = .texts
        passwordField.layer.borderWidth = 1
        passwordField.layer.cornerRadius = 3
        passwordField.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().offset(-15)
            $0.top.equalToSuperview().offset(400)
        }

        view.addSubview(loginButton)
        loginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-50)
            $0.width.equalTo(100)
            $0.height.equalTo(50)
        }
        loginButton.layer.cornerRadius = 25
        loginButton.addTarget(self, action: #selector(loginButtonTap), for: .touchUpInside)
    }

    @objc func loginButtonTap() {
        checkLogin()
    }

    private func createTabBar() {

        let goVC = UINavigationController(rootViewController: GoViewController())
        let editVC = UINavigationController(rootViewController: EditViewController())
        let rallyVC = UINavigationController(rootViewController: RallyViewController())
        let setupVC = UINavigationController(rootViewController: SetupViewController())

        goVC.title = "Go"
        editVC.title = "Edit"
        rallyVC.title = "Rally"
        setupVC.title = "Setup"


        goVC.tabBarItem.image = UIImage(systemName: "house")
        editVC.tabBarItem.image = UIImage(systemName: "slider.vertical.3")
        rallyVC.tabBarItem.image = UIImage(systemName: "steeringwheel")
        setupVC.tabBarItem.image = UIImage(systemName: "gear")

        let tabBarVC = UITabBarController()
        tabBarVC.setViewControllers([goVC, editVC, rallyVC, setupVC], animated: false)
        tabBarVC.modalPresentationStyle = .fullScreen
        tabBarVC.view.isOpaque = true
        tabBarVC.tabBar.backgroundColor = .theme
        present(tabBarVC, animated: false)
    }

    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tap)
    }

    @objc
    private func dismissKeyboard() {
        view.endEditing(true)
    }

    private func checkLogin() {

        if teamsArray.contains(nameField.text ?? "") && passwordsArray.contains(passwordField.text ?? "") {
            createTabBar()
            nameField.text = nil
            passwordField.text = nil
        } else {

            let alert = UIAlertController(title: "Error", message: "Incorrect data!", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Try again", style: .cancel, handler: nil))

            self.present(alert, animated: true)
        }
    }



}


