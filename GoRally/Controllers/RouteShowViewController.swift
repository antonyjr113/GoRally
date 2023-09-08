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

    //let doc:  PDFDocument? = nil

    var webView: WKWebView!


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
        let myURL = URL(string:"https://sgonay.com.pl/arc/roadbooks/roadbook_R1_23.pdf")
        else {
            return
        }
        let myRequest = URLRequest(url: myURL)
        webView.load(myRequest)
    }

    //    func createRouteViewPDF(pdf: PDFDocument) {
    //        let routeVC = UIViewController()
    //        routeVC.view.backgroundColor = .theme
    //        routeVC.modalPresentationStyle = .pageSheet
    //
    //        routeVC.view.addSubview(pdf)
    //
    //    }
}


