//
//  DownloadImageAsyncViewModel.swift
//  DownoadImagesAsyncAwait
//
//  Created by Prajakta Pathak on 2/26/25.
//

import Foundation
import SwiftUI

class DownloadImageAsyncViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    let loader = DownloadImageAsyncImageLoader()

    func fetchImage() {
        // hard code image
        //self.image = UIImage(systemName: "heart.fill")

        // download image with escaping closure
        loader.downloadWithEscaping { [weak self] image, error in
            DispatchQueue.main.async {
                if let image = image {
                    self?.image = image
                }
            }
        }
    }
}
