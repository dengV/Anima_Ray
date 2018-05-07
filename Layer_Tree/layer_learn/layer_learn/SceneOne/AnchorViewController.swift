//
//  AnchorViewController.swift
//  layer_learn
//
//  Created by dengjiangzhou on 2018/5/7.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import UIKit

class AnchorViewController: UIViewController {

    
    @IBOutlet weak var hourHand: UIImageView!
    @IBOutlet weak var minuteHand: UIImageView!
    @IBOutlet weak var secondHand: UIImageView!
    
    var timer: Timer
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        timer = Timer(timeInterval: 1.0, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
        
        tick()
        
    }
    
    @objc func tick(){
        let calender = Calendar(identifier: .chinese)
        let unitFlags = Set<Calendar.Component>            ([.hour, .minute, .second])
        
        let components = calender.dateComponents(unitFlags, from: Date(), to: Date())
        
        
    }
    
    
    func testLayout(){
        
        let aView = UIView(frame: CGRect(x: 0, y: 100, width: 100, height: 120))
        aView.backgroundColor = UIColor.red
        view.addSubview(aView)
        aView.layer.anchorPoint = CGPoint(x: 0.0, y: 0.5)
        
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
