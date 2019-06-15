//
//  UIButton+WebImage.swift
//  Pods
//
//  Created by 王小涛 on 2017/8/23.
//
//

import Kingfisher

public extension WebImage where Base: UIButton {
    
    func setImage(withURLString urlString: String?,
                  for state: UIControl.State = .normal,
                  placeholder: UIImage? = nil,
                  progress: ((_ receivedSize: Int64, _ totalSize: Int64) -> Void)? = nil,
                  success: ((UIImage) -> Void)? = nil,
                  failure: ((Error) -> Void)? = nil) {
        
        let url: URL? = {
            guard let urlString = urlString else {
                return nil
            }
            return URL(string: urlString)
        }()
        
        setImage(with: url, for: state, placeholder: placeholder, progress: progress, success: success, failure: failure)
    }
    
    func setImage(with url: URL?,
                         for state: UIControl.State,
                         placeholder: UIImage? = nil,
                         progress: ((_ receivedSize: Int64, _ totalSize: Int64) -> Void)? = nil,
                         success: ((UIImage) -> Void)? = nil,
                         failure: ((Error) -> Void)? = nil) {

        base.kf.setImage(with: url, for: state, placeholder: placeholder, progressBlock: progress) {
            switch $0 {
            case let .success(value):
                success?(value.image)
            case let .failure(error):
                failure?(error)
            }
        }
    }
}
