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
    
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let url = URL(string: "http://ouo6mncln.bkt.clouddn.com/3DFCB247-7233-4F5B-9C25-8AFAFA976B3F.webp")
        //
        //        downloader.dowload(with: url, progress: { (p1, p2) in
        //            print("p1 = \(p1), p2 = \(p2)")
        //        }, success: { (image, url) in
        //            print("success: url = \(url)")
        //        }) { (error) in
        //            print("error: \(error)")
        //        }
        
        imageView.backgroundColor = .red
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

