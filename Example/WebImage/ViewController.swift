//
//  ViewController.swift
//  WebImage
//
//  Created by wangxiaotao on 08/23/2017.
//  Copyright (c) 2017 wangxiaotao. All rights reserved.
//

import UIKit
import WebImage

class ViewController: UIViewController {
    
    @IBOutlet weak var an: UIImageView!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    let key = "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1503397296336&di=8febd8f2960b049cbbe81cc09dee8b0a&imgtype=0&src=http%3A%2F%2Fimg1.sc115.com%2Fuploads%2Fsc%2Fjpg%2F144%2F18479.jpg"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        button.addTarget(self, action: #selector(clickButton(sender:)), for: .touchUpInside)
        
//        an.web.setImage(withURLString: key)
        
//        let url = URL(string: "http://ouo6mncln.bkt.clouddn.com/3DFCB247-7233-4F5B-9C25-8AFAFA976B3F.webp")

        DefaultImageDownloader.shared.donwloadImage(with: URL(string: key)!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickButton(sender: Any) {
//        imageView.image = DefaultImageCache.shared.retrieveImage(forKey: key, completed: <#(UIImage?) -> Void#>)
    }
}

