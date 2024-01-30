//
//  ImageViewModel.swift
//  Hotels
//
//  Created by Lol Kek on 29/01/2024.
//

import UIKit

class ImageViewModel: ObservableObject {
    @Published var image: UIImage?
    @Published var isLoading = false
    @Published var isError = false
    
    private let imageURL: String?

    init(urlString: String?) {
        self.imageURL = urlString
    }
    
    func loadImage() {
        guard let urlString = imageURL else { return }
        
        isLoading = true
        
        APIClient.fetchImageData(urlString: urlString) { [weak self] result in
            switch result {
            case .success(let imageData):
                if let loadedImage = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                    //    self?.imageCache.setObject(loadedImage, forKey: urlString as NSString)
                        self?.image = loadedImage
                    }
                } else {
                    DispatchQueue.main.async {
                        self?.isError = true
                    }
                }
                
            case .failure:
                DispatchQueue.main.async {
                    self?.isError = true
                }
            }
            DispatchQueue.main.async {
                self?.isLoading = false
            }
        }
    }
}
