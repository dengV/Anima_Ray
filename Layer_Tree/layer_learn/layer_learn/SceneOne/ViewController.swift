//
//  ViewController.swift
//  layer_learn
//
//  Created by dengjiangzhou on 2018/4/24.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import UIKit

import QuartzCore




class ViewController: UIViewController {
    
    
    @IBOutlet weak var layerView: UIView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        /*
        let blueLayer = CALayer()
        blueLayer.frame = layerView.bounds.insetBy(dx: 50, dy: 50)
        blueLayer.backgroundColor = UIColor.blue.cgColor
        layerView.layer.addSublayer(blueLayer)
        */
        
        
        let img = UIImage(named: "balloon")
        layerView.layer.contents = img?.cgImage
        layerView.layer.contentsGravity = "center"
        //  "resizeAspect"
        layerView.layer.contentsScale = 0.8
        //      UIScreen.main.scale
        //      (img?.scale)!
        //      2.0
        
        layerView.layer.masksToBounds = true
        
    }

    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

