//
//  LoginViewController.swift
//  GoRally
//
//  Created by Don Wolfton on 28.10.23.
//

import UIKit

class LoginViewController: UIViewController, AvoidingKeyboard, HideKeyboardWhenTappedAround {

    var userData: Team?

    let userDefaults = UserDefaults.standard

    var isSuccessLogin: Bool!

    let helloTitle: UILabel = {
        let label = UILabel()
        label.text = "Let's race!"
        label.textColor = .texts
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 32)
        return label
    }()

    let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = .blue
        return button
    }()

    let nameField: UITextField = {
        let name = UITextField()
        name.backgroundColor = .white
        name.attributedPlaceholder = NSAttributedString(
            string: "Enter team name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.texts]
        )
        return name
    }()


    let passwordField: UITextField = {
        let pass = UITextField()
        pass.backgroundColor = .white
        pass.attributedPlaceholder = NSAttributedString(
            string: "Enter password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.texts]
        )
        return pass
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

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

        checkLoginStruct(name: nameField.text ?? "", pass: passwordField.text ?? "")
    }

    private func checkLoginStruct(name: String, pass: String) {

        //userData = Team(teamName: nameField.text!, teamPass: passwordField.text!)

        if teamsData.keys.contains(nameField.text!) && teamsData.values.contains(passwordField.text!) {
            isSuccessLogin = true
            createTabBar()
            nameField.text = nil
            passwordField.text = nil
            userDefaults.set(userData?.teamName, forKey: "teamNameEntered")
            userDefaults.set(userData?.teamPass, forKey: "teamPassEntered")
        } else {
            isSuccessLogin = false

            let alert = UIAlertController(title: "Error", message: "Incorrect data! Try to rewrite your team name and password :)", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Try again", style: .cancel, handler: nil))

            self.present(alert, animated: true)
        }
    }

    private func createTabBar() {

        let editVC = UINavigationController(rootViewController: RoutesViewController())
        let rallyVC = UINavigationController(rootViewController: RallyViewController())
        let setupVC = UINavigationController(rootViewController: SetupViewController())

        editVC.title = "Routes"
        rallyVC.title = "Rally"
        setupVC.title = "Setup"

        editVC.tabBarItem.image = UIImage(systemName: "slider.vertical.3")
        rallyVC.tabBarItem.image = UIImage(systemName: "steeringwheel")
        setupVC.tabBarItem.image = UIImage(systemName: "gear")

        let tabBarVC = UITabBarController()
        tabBarVC.setViewControllers([editVC, rallyVC, setupVC], animated: false)
        tabBarVC.modalPresentationStyle = .fullScreen
        tabBarVC.view.isOpaque = true
        tabBarVC.tabBar.backgroundColor = .theme
        present(tabBarVC, animated: false)

        if #available(iOS 15, *) {
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithOpaqueBackground()
            navigationBarAppearance.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor : UIColor.texts
            ]
            navigationBarAppearance.backgroundColor = UIColor.theme
            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
            UINavigationBar.appearance().compactAppearance = navigationBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance

            let tabBarApperance = UITabBarAppearance()
            tabBarApperance.configureWithOpaqueBackground()
            tabBarApperance.backgroundColor = UIColor.theme
            UITabBar.appearance().scrollEdgeAppearance = tabBarApperance
            UITabBar.appearance().standardAppearance = tabBarApperance
        }
    }

     func showLogin() {
        let loginVC = LoginViewController()
        loginVC.modalPresentationStyle = .overFullScreen
        self.present(loginVC, animated: false)

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
}