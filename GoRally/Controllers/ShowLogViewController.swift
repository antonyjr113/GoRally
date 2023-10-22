//
//  ShowLogViewController.swift
//  GoRally
//
//  Created by Don Wolfton on 22.10.23.
//

import UIKit

class ShowLogViewController: UIViewController {

    let logView: UITextView = {
        let log = UITextView()
        log.textColor = .texts
        log.backgroundColor = .white
        log.font = UIFont.systemFont(ofSize: 18)
        return log
    }()

    let closeButton: UIButton = {
        let button = UIButton()
        button.setTitle("X", for: .normal)
        button.backgroundColor = .theme
        button.titleLabel?.textColor = .texts
        button.titleLabel?.font = .boldSystemFont(ofSize: 24)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(logView)
        logView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalToSuperview()
            $0.centerX.centerY.equalToSuperview()
        }
        logView.text = LoggingManager.shared.logStr
        logView.isEditable = false

        view.addSubview(closeButton)
        closeButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-12.5)
            $0.top.equalTo(5)
            $0.width.equalTo(35)
            $0.height.equalTo(35)
        }
        closeButton.layer.cornerRadius = 17.5
        closeButton.addTarget(self, action: #selector(closeButtonTap), for: .touchUpInside)
    }

    @objc func closeButtonTap() {
        self.dismiss(animated: true)
    }
}
