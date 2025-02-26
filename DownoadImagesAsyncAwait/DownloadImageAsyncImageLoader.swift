//
//  DownloadImageAsyncImageLoader.swift
//  DownoadImagesAsyncAwait
//
//  Created by Prajakta Pathak on 2/26/25.
//

import Foundation
import SwiftUI

class DownloadImageAsyncImageLoader {

    func downloadWithEscaping(completionHandler: @escaping (_ image: UIImage?, _ error: Error?) -> ()) {
        if let url = URL(string: "https://picsum.photos/200") {
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data,
                      let image = UIImage(data: data),
                      let response = response as? HTTPURLResponse,
                     response.statusCode >= 200 && response.statusCode < 300 else {
                    completionHandler(nil, error)
                    return
                }
                completionHandler(image, nil)
            }
            .resume()
        }
    }
}
