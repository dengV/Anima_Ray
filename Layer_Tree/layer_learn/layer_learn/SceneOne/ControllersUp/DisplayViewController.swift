//
//  DisplayViewController.swift
//  layer_learn
//
//  Created by dengjiangzhou on 2018/4/25.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import UIKit

class DisplayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let blueLayer = CALayer()
        blueLayer.frame = CGRect(x: 50.0, y: 100.0, width: 100.0, height: 100.0)
        blueLayer.backgroundColor = UIColor.blue.cgColor
        
        blueLayer.delegate = self       //  这行代码， 有毒
        blueLayer.contentsScale = UIScreen.main.scale
        view.layer.addSublayer(blueLayer)
        
       // blueLayer.display()
        //  force layer to redraw
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}




extension DisplayViewController: CALayerDelegate{
    
    func draw(_ layer: CALayer, in ctx: CGContext) {
        
        ctx.setLineWidth(10.0)
        ctx.setStrokeColor(UIColor.red.cgColor)
        ctx.strokeEllipse(in: layer.bounds)
        
        
    }
    
    
}
