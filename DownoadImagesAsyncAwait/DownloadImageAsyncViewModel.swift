//
//  DownloadImageAsyncViewModel.swift
//  DownoadImagesAsyncAwait
//
//  Created by Prajakta Pathak on 2/26/25.
//

import Foundation
import SwiftUI
import Combine

class DownloadImageAsyncViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    let loader = DownloadImageAsyncImageLoader()
    var cancellables = Set<AnyCancellable>()

    func fetchImage() {
        // hard code image
        //self.image = UIImage(systemName: "heart.fill")

        // download image with escaping closure
        /*
        loader.downloadWithEscaping { [weak self] image, error in
            DispatchQueue.main.async {
                if let image = image {
                    self?.image = image
                }
            }
        }
         */

        // download image with combine
        loader.downloadWithCombine()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Success")
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { returnedImage in
                self.image = returnedImage
            }
            .store(in: &cancellables)


    }
}
