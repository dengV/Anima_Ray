//
//  ViewControllerFour.swift
//  BahamaAirLoginScreen
//
//  Created by dengjiangzhou on 2018/4/8.
//  Copyright © 2018年 Razeware LLC. All rights reserved.
//

import UIKit

class ViewControllerFour: UIViewController {
    
    
    @IBOutlet weak var textViewOne: UITextView!
    
    @IBOutlet weak var textViewTwo: UITextView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        textViewOne.layer.borderColor = UIColor.blue.cgColor
        textViewOne.layer.borderWidth = 2
        
        
        textViewTwo.layer.borderColor = UIColor.cyan.cgColor
        textViewTwo.layer.borderWidth = 3
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
