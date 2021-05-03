//
//  TWAuthWebviewController.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 4/25/21.
//

import Foundation
import WebKit

protocol TWAuthWebViewDelegate: AnyObject {
    func completeAuthentication(_ vc: UIViewController, token: String, scopes: [String]) -> Void
}

final class TWAuthWebViewController: UIViewController {
    private let redirectURI: String
    private let authURL: URL
    private let state: String
    private weak var delegate: TWAuthWebViewDelegate?
    
    private var webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    public init(delegate: TWAuthWebViewDelegate?, redirectURI: String, authURL: URL, state: String) {
        self.delegate = delegate
        self.redirectURI = redirectURI
        self.authURL = authURL
        self.state = state
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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

//MARK: - Web Kit Navigation Delegate
extension TWAuthWebViewController: WKNavigationDelegate {
    
    public func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        handleRedirect(url: webView.url)
    }
    
    public func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        if let response = navigationResponse.response as? HTTPURLResponse, 500 ..< 600 ~= response.statusCode {
            EVLog(text: "Twitch - Status code was \(response.statusCode), but expected 2xx.", line: #line, fileName: #file)
            dismiss(animated: true, completion: nil)
        }
        decisionHandler(.allow)
    }
    
    private func handleRedirect(url: URL?) {
        if isCorrectRedirectURL(webView.url),
           let fragment = getFragments(from: webView.url),
           let token = fragment["access_token"],
           let returnState = fragment["state"],
           let scopesStr = fragment["scope"] {
            if state == returnState {
                delegate?.completeAuthentication(self, token: token, scopes: scopesStr.components(separatedBy: ":"))
            } else {
                EVLog(text: "Invalid state: sent: \(state), returned was: \(returnState)", line: #line, fileName: #file)
            }
            dismiss(animated: true, completion: nil)
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
    
    private func getFragments(from url: URL?) -> [String:String]? {
        guard let urlString = url?.absoluteString,
              let components = URLComponents(string: urlString),
              let fragment = components.fragment else {
            return nil
        }
        return fragment.components(separatedBy: "&").map({
            $0.components(separatedBy: "=")
        }).reduce(into: [String:String]()) { dict, pair in
            if pair.count == 2 {
                dict[pair[0]] = pair[1]
            }
        }
    }
}
