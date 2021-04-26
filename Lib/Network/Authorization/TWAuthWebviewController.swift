//
//  TWAuthWebviewController.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 4/25/21.
//

import Foundation
import WebKit

public final class TWAuthWebviewController: UIViewController {
    private let redirectURI: String
    private let authURL: URL
    
    private var webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    public init(redirectURI: String, authURL: URL) {
        self.redirectURI = redirectURI
        self.authURL = authURL
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Life Cycle Methods
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupChildViews()
        webView.navigationDelegate = self
        webView.load(URLRequest(url: authURL))
    }
    
    private func setupChildViews() {
        view.addSubview(webView)
        
        NSLayoutConstraint.activate([
            webView.leftAnchor.constraint(equalTo: view.leftAnchor),
            webView.rightAnchor.constraint(equalTo: view.rightAnchor),
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: Web Kit Navigation Delegate
extension TWAuthWebviewController: WKNavigationDelegate {
    
    public func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        handleRedirect(url: webView.url)
    }
    
    public func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        if let response = navigationResponse.response as? HTTPURLResponse, 500 ..< 600 ~= response.statusCode {
            print("Twitch - Status code was \(response.statusCode), but expected 2xx. Twitch might be temporarily down.")
            dismiss(animated: true, completion: nil)
        }
        decisionHandler(.allow)
    }
    
    // MARK: Private helper Methods
    
    private func handleRedirect(url: URL?) {
        //TODO completion handler won't work use a delegate or just set the param as internal
        if isCorrectRedirectURL(webView.url) {
            dismiss(animated: true, completion: nil)
        } else {
            dismiss(animated: true, completion: (nil, NSError(domain: <#T##String#>, code: <#T##Int#>, userInfo: <#T##[String : Any]?#>)))
        }
    }
    
    private func isCorrectRedirectURL(_ url: URL?) -> Bool {
        guard let urlStr = url?.absoluteString, urlStr.count >= redirectURI.count else {
            return false
        }
        let index = urlStr.index(urlStr.startIndex, offsetBy: redirectURI.count)
        let substring = urlStr.prefix(upTo: index)
        return substring == redirectURI
    }
    
    //TODO use my abstract fragment logic, its better, basically use my error handling
    private func extractFragment(_ param: String, from url: URL?) -> String? {
        guard let urlString = url?.absoluteString, let comps = URLComponents(string: urlString), let fragment = comps.fragment else {
            return nil
        }
        let dict = fragment.components(separatedBy: "&").map({
            $0.components(separatedBy: "=")
        }).reduce(into: [String:String]()) { dict, pair in
            if pair.count == 2 {
                dict[pair[0]] = pair[1]
            }
        }
        return dict[param]
    }
}
