//
//  ImageCacheType.swift
//  Pods
//
//  Created by 王小涛 on 2017/8/24.
//
//

import Kingfisher

public protocol ImageCacheType {
    
    func store(_ image: UIImage, forKey key: String)
    func retrieveImage(forKey key: String) -> UIImage?
    func removeImage(forKey key: String)
}

extension ImageCacheType {
    
    public func store(_ image: UIImage, forKey key: String) {
        ImageCache.default.store(image, forKey: key)
    }

    public func retrieveImage(forKey key: String) -> UIImage? {
        if let image = ImageCache.default.retrieveImageInMemoryCache(forKey: key) {
            return image
        }
        return ImageCache.default.retrieveImageInDiskCache(forKey: key)
    }

    public func removeImage(forKey key: String) {
        ImageCache.default.removeImage(forKey: key)
    }
}

public class DefaultImageCache: ImageCacheType {
    public static let shared = DefaultImageCache()
    private init() {}
}
