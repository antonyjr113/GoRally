//
//  SplashScreenViewController.swift
//  GoRally
//
//  Created by Don Wolfton on 9.10.23.
//

import UIKit
import Lottie

class SplashScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let animationView = LottieAnimationView(name: "animationSplash")

        self.view.addSubview(animationView)

        animationView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(300)
        }

        animationView.play { finished in
            animationView.stop()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                self.dismiss(animated: false)
            })

        }
    }
}
