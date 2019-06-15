//
//  ImageDownloaderType.swift
//  Pods
//
//  Created by 王小涛 on 2017/8/23.
//
//

import Kingfisher

public protocol ImageDownloaderType {
    func donwloadImage(with url: URL,
                       progress: ((_ receivedSize: Int64, _ totalSize: Int64) -> Void)?,
                       success: ((UIImage) -> Void)?,
                       failure: ((Error) -> Void)?)
}

extension ImageDownloaderType {
    public func donwloadImage(with url: URL,
                              progress: ((_ receivedSize: Int64, _ totalSize: Int64) -> Void)? = nil,
                              success: ((UIImage) -> Void)? = nil,
                              failure: ((Error) -> Void)? = nil) {

        ImageDownloader.default.downloadImage(with: url, progressBlock: progress) {
            switch $0 {
            case let .success(value):
                DefaultImageCache.shared.store(value.image, forKey: url.absoluteString)
                success?(value.image)
            case let .failure(error):
                failure?(error)
            }
        }
    }
}

public class DefaultImageDownloader: ImageDownloaderType {
    public static let shared = DefaultImageDownloader()
    private init() {}
}
