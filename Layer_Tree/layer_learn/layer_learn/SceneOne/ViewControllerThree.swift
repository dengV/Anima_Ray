//
//  ViewControllerThree.swift
//  layer_learn
//
//  Created by dengjiangzhou on 2018/4/25.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import UIKit

class ViewControllerThree: UIViewController {

    
    @IBOutlet weak var lhsView: UIView!
    @IBOutlet weak var rhsView: UIView!
    @IBOutlet weak var lhsDownView: UIView!
    
    @IBOutlet weak var rhsDownView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lhsView.layer.addStretchable(image: UIImage(named: "summericons_100px_00")!, contentCenter: CGRect(x: 0.25, y: 0.25, width: 0.5, height: 0.5))
        rhsView.layer.addStretchable(image: UIImage(named: "summericons_100px_01")!, contentCenter: CGRect(x: 0.25, y: 0.25, width: 0.5, height: 0.5))
        
        
        
        
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


extension CALayer{
    
    func addStretchable(image: UIImage, contentCenter: CGRect){
        self.contents = image.cgImage
        self.contentsCenter = contentCenter
        self.contentsGravity = "resizeAspect"
    }
    
}
