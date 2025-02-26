//
//  DownloadImageAsyncImageLoader.swift
//  DownoadImagesAsyncAwait
//
//  Created by Prajakta Pathak on 2/26/25.
//

import Foundation
import SwiftUI
import Combine

class DownloadImageAsyncImageLoader {

    func handleResponse(data: Data?, response: URLResponse?) -> UIImage? {
        guard let data = data,
              let image = UIImage(data: data),
              let response = response as? HTTPURLResponse,
             response.statusCode >= 200 && response.statusCode < 300 else {
            return nil
        }
        return image
    }


    func downloadWithEscaping(completionHandler: @escaping (_ image: UIImage?, _ error: Error?) -> ()) {
        if let url = URL(string: "https://picsum.photos/200") {
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) {[weak self] data, response, error in
                let image = self?.handleResponse(data: data, response: response)
                completionHandler(image, error)
            }
            .resume()
        }
    }

    func downloadWithCombine() -> AnyPublisher <UIImage?, URLError> {
         let url = URL(string: "https://picsum.photos/200")!
         let request = URLRequest(url: url)
           let publisher =  URLSession.shared.dataTaskPublisher(for: url)
                .map(handleResponse)
                .eraseToAnyPublisher()
        return publisher
    }
}
