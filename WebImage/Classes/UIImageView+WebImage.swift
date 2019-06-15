//
//  UIImageView+WebImage.swift
//  Pods
//
//  Created by 王小涛 on 2017/8/23.
//
//

import Kingfisher

public extension WebImage where Base: UIImageView {
    
    func setImage(withURLString urlString: String?,
                         placeholder: UIImage? = nil,
                         progress: ((_ receivedSize: Int64, _ totalSize: Int64) -> Void)? = nil,
                         success: ((UIImage) -> Void)? = nil,
                         failure: ((Error) -> Void)? = nil){
    
        let url: URL? = {
            guard let urlString = urlString else {
                return nil
            }
            return URL(string: urlString)
        }()
        
        setImage(with: url, placeholder: placeholder, progress: progress, success: success, failure: failure)
    }
    
    func setImage(with url: URL?,
                  placeholder: UIImage? = nil,
                  progress: ((_ receivedSize: Int64, _ totalSize: Int64) -> Void)? = nil,
                  success: ((UIImage) -> Void)? = nil,
                  failure: ((Error) -> Void)? = nil) {

        base.kf.setImage(with: url, placeholder: placeholder, progressBlock: progress) {
            switch $0 {
            case let .success(value):
                success?(value.image)
            case let .failure(error):
                failure?(error)
            }
        }
    }
}
