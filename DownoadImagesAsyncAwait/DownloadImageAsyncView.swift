//
//  DownloadImageAsyncView.swift
//  DownoadImagesAsyncAwait
//
//  Created by Prajakta Pathak on 2/26/25.
//

import SwiftUI

struct DownloadImageAsyncView: View {
    @StateObject var vm = DownloadImageAsyncViewModel()
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 250)
            }
        }
        .onAppear() {
            vm.fetchImage()
        }
    }
}

#Preview {
    DownloadImageAsyncView()
}
