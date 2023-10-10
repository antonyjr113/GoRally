//
//  Route view.swift
//  GoRally
//
//  Created by Don Wolfton on 7.09.23.
//

import UIKit
import WebKit
import PDFKit

class RouteShowViewController: UIViewController, WKUIDelegate {

    var webView: WKWebView!

    var routeLink: String!

    init(routeLink: String) {
        self.routeLink = routeLink
        super.init(nibName: "RouteShowViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
        webView.frame = view.bounds

    }


    override func viewDidLoad() {
        super.viewDidLoad()
        guard
            let myURL = URL(string: routeLink)
        else {
            return
        }
        let myRequest = URLRequest(url: myURL)
        webView.load(myRequest)
        print(routeLink)
    }

}


