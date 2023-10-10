//
//  SetupViewController.swift
//  GoRally
//
//  Created by Don Wolfton on 14.08.23.
//

import Foundation
import UIKit

class SetupViewController: UIViewController, AvoidingKeyboard, HideKeyboardWhenTappedAround {

    let logoutButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemRed
        button.setTitle("Log Out", for: .normal)
        return button
    }()

    let timeIntervalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    let intervalField: UITextField = {
        let field = UITextField()
        field.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        field.backgroundColor = .fields
        field.textAlignment = .center
        field.font = .systemFont(ofSize: 24)
        field.text = "1"
        return field
    }()

    let intervalText: UILabel = {
        let text = UILabel()
        text.frame = CGRect(x: 0, y: 0, width: 10, height: 20)
        text.backgroundColor = .theme
        text.font = .systemFont(ofSize: 24)
        text.text = "Set record interval, sec"
        return text
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .theme
        title = "Setup"

        view.addSubview(timeIntervalStack)
        timeIntervalStack.backgroundColor = .texts
        timeIntervalStack.snp.makeConstraints {
            $0.top.equalToSuperview().offset(120)
            $0.leading.trailing.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }

        timeIntervalStack.addArrangedSubview(intervalText)

        timeIntervalStack.addArrangedSubview(intervalField)
        intervalField.snp.makeConstraints {
            $0.width.height.equalTo(50)
        }

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
