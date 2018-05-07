//
//  ViewControllerTwo.swift
//  layer_learn
//
//  Created by dengjiangzhou on 2018/4/25.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import UIKit

class ViewControllerTwo: UIViewController {
    
    @IBOutlet weak var coreView: UIView!
    @IBOutlet weak var shipView: UIView!
    @IBOutlet weak var iglooView: UIView!
    @IBOutlet weak var anchorView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        coreView.layer.addSprite(image: UIImage(named: "summericons_100px_00")!, rect: CGRect(x: 0, y: 0.5, width: 0.5, height: 0.5))
        shipView.layer.addSprite(image: UIImage(named: "summericons_100px_01")!, rect: CGRect(x: 0.5, y: 0, width: 0.5, height: 0.5))
        iglooView.layer.addSprite(image: UIImage(named: "summericons_100px_02")!, rect: CGRect(x: 0, y: 0.5, width: 0.5, height: 0.5))
        anchorView.layer.addSprite(image: UIImage(named: "summericons_100px_03")!, rect: CGRect(x: 0.5, y: 0, width: 0.5, height: 0.5))
        
        
        
    }
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}



extension CALayer{
    func addSprite(image: UIImage, rect: CGRect){
        self.contents = image.cgImage
        self.contentsGravity = "resizeAspect"
        self.contentsRect = rect
        self.contentsScale = 2.0
    }
    
    
}
