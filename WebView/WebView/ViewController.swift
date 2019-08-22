//
//  ViewController.swift
//  WebView
//
//  Created by DuyCuong on 8/22/19.
//  Copyright © 2019 DuyCuong. All rights reserved.
//

import UIKit

import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.facebook.com/photo.php?fbid=487212658744997&set=a.102280120571588&type=3&theater")
        webView.load(URLRequest(url: url!))
        
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        toolbarItems = [refresh]
        navigationController?.isToolbarHidden = false
    }

    // func loadView(): khởi tạo đầu tiên khi khởi tạo một view controller. Dùng để khởi tạo các UI (label...) trong view lớn này.
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }

}

