//
//  ViewController.swift
//  DownloadWebContent
//
//  Created by sneakysneak on 30/11/2018.
//  Copyright © 2018 sneakysneak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
//        webView.loadHTMLString("<h1>Hello there!</h1>", baseURL: nil )
        
//        webView.loadRequest(URLRequest(url: url))
        
        if let url = URL(string: "https://www.stackoverflow.com") {
            
            let request = NSMutableURLRequest(url: url)
            
            let task = URLSession.shared.dataTask(with: request as URLRequest) {
                data, response, error in
                
                if let error = error {
                    
                    print(error)
                    
                } else {
                    if let unwrappedData = data {
                        let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                        
                        print(dataString)
                        
                        DispatchQueue.main.sync(execute: {
                            //Update UI
                        })
                    }
                }
            }
            task.resume()
        }
        //This would happen before the above stuff, multithreaded programming
        //Till getting content from url we can display a loading message
        print("Hey")
    }


}

