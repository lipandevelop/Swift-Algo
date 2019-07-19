//
//  DownloadAndLRUCacheImageBackgroundThread.swift
//  TT
//
//  Created by Li Pan on 2019-03-25.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
    URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
}

func downloadImage(from url: URL) {
    print("Download Started")
    getData(from: url) { data, response, error in
        guard let data = data, error == nil else { return }
        print(response?.suggestedFilename ?? url.lastPathComponent)
        print("Download Finished")
        DispatchQueue.main.async() {
//            self.imageView.image = UIImage(data: data)
        }
    }
}

//override func viewDidLoad() {
//    super.viewDidLoad()
//    // Do any additional setup after loading the view, typically from a nib.
//    print("Begin of code")
//    let url = URL(string: "http://www.apple.com/euro/ios/ios8/a/generic/images/og.png")!
//    downloadImage(from: url)
//    print("End of code. The image will continue downloading in the background and it will be loaded when it ends.")
//}
