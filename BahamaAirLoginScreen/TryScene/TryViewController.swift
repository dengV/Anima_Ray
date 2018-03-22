//
//  TryViewController.swift
//  BahamaAirLoginScreen
//
//  Created by dengjiangzhou on 2018/3/22.
//  Copyright © 2018年 Razeware LLC. All rights reserved.
//

import UIKit

class TryViewController: UIViewController {

    var animationContainerView: UIView!
    let newView = UIImageView(image: UIImage(named: "banner"))
    
    @IBOutlet weak var toolbar: UIToolbar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        animationContainerView = UIView(frame: view.bounds)
        animationContainerView.frame = view.bounds
       // view.addSubview(animationContainerView)
        view.insertSubview(animationContainerView, belowSubview: toolbar)
        
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        newView.center = animationContainerView.center
        UIView.transition(with: animationContainerView, duration: 0.33, options: [.curveEaseOut, .transitionFlipFromBottom], animations: {
            self.animationContainerView.addSubview(self.newView)
        }, completion: nil)
        
        
    }
    
    
    
    
    @IBAction func removeAnimation(_ sender: UIBarButtonItem) {
        UIView.transition(with: animationContainerView, duration: 0.33, options: [.curveEaseOut, .transitionFlipFromBottom], animations: {
            self.newView.removeFromSuperview()
        }, completion: nil)
        
        
        
        
    }
    
    
    
    @IBAction func hideAnimation(_ sender: UIBarButtonItem) {
        
        UIView.transition(with: self.newView, duration: 0.33, options: [.curveEaseOut, .transitionFlipFromBottom], animations: {
            self.newView.isHidden = true
        }, completion: nil)
        
        
        
    }
    
    
    
    
    
    @IBAction func replaceAnimation(_ sender: UIBarButtonItem) {
        let goView = UIImageView(image: UIImage(named: "balloon"))
        goView.center = animationContainerView.center
        animationContainerView.addSubview(goView)
        UIView.transition(from: newView, to: goView, duration: 0.33, options: .transitionFlipFromTop, completion: nil)
    }
    
    
    
    @IBAction func resetAnimation(_ sender: UIBarButtonItem) {

        if newView.isHidden {
            newView.isHidden = false
        }
        else if newView.superview == nil{
            animationContainerView.addSubview(self.newView)
        }
      /*  if newView.superview != nil{
            
            print("visible")
        }
        else{
            animationContainerView.addSubview(self.newView)
            print("not visible")
        }*/
     /*   if newView.isDescendant(of: animationContainerView) {
            print("visible")
        }
        else{
            animationContainerView.addSubview(self.newView)
            print("not visible")
        }*/
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
