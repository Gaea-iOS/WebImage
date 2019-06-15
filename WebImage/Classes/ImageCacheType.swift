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
    func retrieveImage(forKey key: String, completed: @escaping (UIImage?) -> Void)
    func removeImage(forKey key: String)
    
    func clearCache(completed: (() -> Void)?)
    func isImageCached(forKey key: String) -> Bool
}

extension ImageCacheType {
    
    public func store(_ image: UIImage, forKey key: String) {
        ImageCache.default.store(image, forKey: key)
    }

    public func retrieveImage(forKey key: String, completed: @escaping (UIImage?) -> Void) {
        return ImageCache.default.retrieveImageInDiskCache(forKey: key, completionHandler: {
            switch $0 {
            case let .success(value):
                completed(value)
            case .failure:
                completed(nil)
            }
        })
    }

    public func removeImage(forKey key: String) {
        ImageCache.default.removeImage(forKey: key)
    }
    
    public func clearCache(completed: (() -> Void)? = nil) {
        ImageCache.default.clearMemoryCache()
        ImageCache.default.clearDiskCache(completion: completed)
    }
    
    public func isImageCached(forKey key: String) -> Bool {
        return ImageCache.default.imageCachedType(forKey: key).cached
    }
}

public class DefaultImageCache: ImageCacheType {
    public static let shared = DefaultImageCache()
    private init() {}
}
