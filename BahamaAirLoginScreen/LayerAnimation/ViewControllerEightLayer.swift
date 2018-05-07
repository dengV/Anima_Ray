

import UIKit




public func tintBackgroundColor(layer: CALayer, toColor: UIColor){
    let animation = CABasicAnimation(keyPath: "backgroundColor")
    animation.fromValue = layer.backgroundColor
    animation.toValue = toColor.cgColor
    animation.duration = 1.0
    layer.add(animation, forKey: nil)
    layer.backgroundColor = toColor.cgColor
    
/*
     As an added bonus, since your new function tintBackgroundColor is a top-level function, you can re-use it anywhere you like in your project!
     */
}



func roundCorners(layer: CALayer, toRadius: CGFloat){
    let animation = CABasicAnimation(keyPath: "cornerRadius")
    animation.fromValue = layer.cornerRadius
    animation.toValue = toRadius
    animation.duration = 0.33
    layer.add(animation, forKey: nil)
    layer.cornerRadius = toRadius
    
}   //  the layer specific property cornerRadius




class ViewControllerEightLayer: UIViewController {

  // MARK: IB outlets

  @IBOutlet var loginButton: UIButton!
  @IBOutlet var heading: UILabel!
  @IBOutlet var username: UITextField!
  @IBOutlet var password: UITextField!

  @IBOutlet var cloud1: UIImageView!
  @IBOutlet var cloud2: UIImageView!
  @IBOutlet var cloud3: UIImageView!
  @IBOutlet var cloud4: UIImageView!

  // MARK: further UI

  let spinner = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
  let status = UIImageView(image: UIImage(named: "banner"))
  let label = UILabel()
  let messages = ["Connecting ...", "Authorizing ...", "Sending credentials ...", "Failed"]

  var statusPosition = CGPoint.zero

    
// DNG methods
    
    let tabBarViewController = UIApplication.shared.keyWindow!.rootViewController as! UITabBarController
    
    let infoLabel = UILabel()
  // MARK: view controller methods
    
    
  override func viewDidLoad() {
    super.viewDidLoad()

    //set up the UI
    loginButton.layer.cornerRadius = 8.0
    loginButton.layer.masksToBounds = true

    spinner.frame = CGRect(x: -20.0, y: 6.0, width: 20.0, height: 20.0)
    spinner.startAnimating()
    spinner.alpha = 0.0
    loginButton.addSubview(spinner)

    status.isHidden = true
    status.center = loginButton.center
    view.addSubview(status)

    label.frame = CGRect(x: 0.0, y: 0.0, width: status.frame.size.width, height: status.frame.size.height)
    label.font = UIFont(name: "HelveticaNeue", size: 18.0)
    label.textColor = UIColor(red: 0.89, green: 0.38, blue: 0.0, alpha: 1.0)
    label.textAlignment = .center
    status.addSubview(label)

    statusPosition = status.center
    
    infoLabel.frame = CGRect(x: view.bounds.size.width, y: loginButton.center.y + 60.0, width: view.frame.size.width, height: 30)
    loginButton.layer.opacity = 0.0
/*
     DNG,   我有 修改
     
         infoLabel.frame = CGRect(x: 0, y: loginButton.center.y + 60.0, width: view.frame.size.width, height: 30)
     
     动画的加载入口 有区别，
     从 window.rootViewController
     或者 从 其他界面 push 出来
     
     */
    
    
    infoLabel.backgroundColor = UIColor.clear
    infoLabel.font = UIFont(name: "HelveticaNeue", size: 12.0)
    infoLabel.textAlignment = .center
    infoLabel.textColor = UIColor.white
    infoLabel.text = "Tap on a field and enter username and password"
    view.insertSubview(infoLabel, belowSubview: loginButton)
    
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    self.navigationController?.setNavigationBarHidden(true, animated: animated)
    //self.navigationController?.setToolbarHidden(true, animated: true)

    
    
    //self.next?.target(forAction: <#T##Selector#>, withSender: <#T##Any?#>)
    
    
    /*
        var nextResponder = self.next!
        
        while !(nextResponder is UITabBarController) {
            nextResponder = (nextResponder.next)!
        }*/
    /*    let tabBarViewController = nextResponder as! UITabBarController*/
    
    tabBarViewController.tabBar.isHidden = true
    
   // heading.center.x  -= view.bounds.width
    // Comment it,
    // There’s no need to perform this action anymore since you can specify both the start and end values in your layer animation.
    
    
    let flyRight = CABasicAnimation(keyPath: "position.x")
    //  flyRight.fillMode = kCAFillModeBoth
    //  放下面 好。 随用 随 设置
    
    // flyRight.isRemovedOnCompletion = false   //  组 2
    flyRight.fromValue = -view.bounds.size.width/2   //   组 1
    
    flyRight.toValue = view.bounds.size.width/2
    flyRight.duration = 0.5   //2  //0.5
    flyRight.delegate = self
    flyRight.setValue("form", forKey: "name")
    flyRight.setValue(heading.layer, forKey: "layer")
    heading.layer.add(flyRight, forKey: nil)
    
    flyRight.fillMode = kCAFillModeBoth
    flyRight.beginTime = CACurrentMediaTime() + 0.3    //2.0  //0.3
    
    flyRight.setValue(username.layer, forKey: "layer")
    username.layer.add(flyRight, forKey: nil)
    username.layer.position.x = view.bounds.width/2     //   组 1
    
    flyRight.beginTime = CACurrentMediaTime() + 0.4     //4.0  //0.4
    flyRight.setValue(password.layer, forKey: "layer")
    password.layer.add(flyRight, forKey: nil)
    password.layer.position.x = view.bounds.width/2     //   组 1
    
    
    //   Debugging basic animations
   // username.layer.position.x -= view.bounds.width         //  组 2
  //  password.layer.position.x -= view.bounds.width         //  组 2
    
    
   /* delay(5.0) {
        print("Where are the fields?")
    }*/
    
    let cloudAlphaAnimation = CABasicAnimation(keyPath: "opacity") // not "alpha"
    cloudAlphaAnimation.fromValue = 0.0
    cloudAlphaAnimation.toValue = 1.0
    cloudAlphaAnimation.duration = 0.5      //  0.7      // 0.5
    cloudAlphaAnimation.fillMode = kCAFillModeBackwards
    //  返回 cloud 是 不能点击 的 背景 视图，
    //  用 kCAFillModeBackwards 这个， 可真是 太好啦
    
    
    cloudAlphaAnimation.beginTime = CACurrentMediaTime() + 0.5 //0.5
    cloud1.layer.add(cloudAlphaAnimation, forKey: nil)
    cloudAlphaAnimation.beginTime = CACurrentMediaTime() + 0.7  //  1.0     //0.7
    cloud2.layer.add(cloudAlphaAnimation, forKey: nil)
    cloudAlphaAnimation.beginTime = CACurrentMediaTime() + 0.9  //1.5  //   0.9
    cloud3.layer.add(cloudAlphaAnimation, forKey: nil)
    cloudAlphaAnimation.beginTime = CACurrentMediaTime() + 1.1  //2.0 // 1.1
    cloud4.layer.add(cloudAlphaAnimation, forKey: nil)
    
    
    
    
  }//   override func viewWillAppear(_ animated: Bool)

    
    
    
    
    
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
/*
    UIView.animate(withDuration: 0.5) {
      self.heading.center.x += self.view.bounds.width
    }
     
     
     Coupled :
     viewWillAppear
     
     */
    
    
    let groupAnimation = CAAnimationGroup()
    groupAnimation.beginTime = CACurrentMediaTime() + 0.5
    groupAnimation.duration = 0.5
    groupAnimation.fillMode = kCAFillModeBackwards
    
    let scaleDown = CABasicAnimation(keyPath: "transform.scale")
    scaleDown.fromValue = 3.5
    scaleDown.toValue = 1.0
    let rotate = CABasicAnimation(keyPath: "transform.rotation")
    rotate.fromValue = .pi / 4.0
    rotate.toValue = 0.0
    let fade = CABasicAnimation(keyPath: "opacity")
    fade.fromValue = 0.0
    fade.toValue = 1.0
    groupAnimation.animations = [scaleDown, rotate, fade]
    loginButton.layer.add(groupAnimation, forKey: nil)
    loginButton.layer.opacity = 1.0
    animateCloud(layer: cloud1.layer)
    animateCloud(layer: cloud2.layer)
    animateCloud(layer: cloud3.layer)
    animateCloud(layer: cloud4.layer)
    
    let flyLeft = CABasicAnimation(keyPath: "position.x")
    flyLeft.fromValue = view.frame.size.width
            /*          DNG,   我有 修改
 flyLeft.fromValue = infoLabel.layer.position.x + view.frame.size.width
 
     动画的加载入口 有区别，
     从 window.rootViewController
     或者 从 其他界面 push 出来
 
 */
    flyLeft.toValue = 0                             //       DNG,   我有 修改
    flyLeft.duration = 5.0
  //  flyLeft.fillMode = kCAFillModeBoth         // DNG , 我加的
    infoLabel.layer.add(flyLeft, forKey: "infoappear")
    infoLabel.frame.origin.x = 0
    
    let fadeLabelIn = CABasicAnimation(keyPath: "opacity")
    fadeLabelIn.fromValue = 0.2
    fadeLabelIn.toValue = 1.0
    fadeLabelIn.duration = 4.5
    infoLabel.layer.add(fadeLabelIn, forKey: "fadein")
    
    username.delegate = self
    password.delegate = self
  }//  override func viewDidAppear(_ animated: Bool)

    
    
  func showMessage(index: Int) {
    label.text = messages[index]

    UIView.transition(with: status, duration: 0.33,
      options: [.curveEaseOut, .transitionFlipFromBottom],
      animations: {
        self.status.isHidden = false
      },
      completion: {_ in
        //transition completion
        delay(seconds: 2.0) {
          if index < self.messages.count-1 {
            self.removeMessage(index: index)
          } else {
            //reset form
            self.resetForm()
          }
        }
      }
    )
  }

  func removeMessage(index: Int) {

    UIView.animate(withDuration: 0.33, delay: 0.0,
      animations: {
        self.status.center.x += self.view.frame.size.width
      },
      completion: {_ in
        self.status.isHidden = true
        self.status.center = self.statusPosition

        self.showMessage(index: index+1)
      }
    )
  }

  func resetForm(){
    UIView.transition(with: status, duration: 0.2, options: .transitionFlipFromTop,
      animations: {
        self.status.isHidden = true
        self.status.center = self.statusPosition
      },
      completion: { _ in
        let tintColor = UIColor(red: 0.63, green: 0.84, blue: 0.35, alpha: 1.0)
        tintBackgroundColor(layer: self.loginButton.layer, toColor: tintColor)
        roundCorners(layer: self.loginButton.layer, toRadius: 10.0)
    })

    UIView.animate(withDuration: 0.2, delay: 0.0,
      animations: {
        self.spinner.center = CGPoint(x: -20.0, y: 16.0)
        self.spinner.alpha = 0.0
      //  self.loginButton.backgroundColor = UIColor(red: 0.63, green: 0.84, blue: 0.35, alpha: 1.0)
        
        self.loginButton.bounds.size.width -= 80.0
        self.loginButton.center.y -= 60.0
      },
      completion: nil
    )
    
  }// func resetForm() {

    

  // MARK: further methods

    
    
  @IBAction func login() {
    view.endEditing(true)

    UIView.animate(withDuration: 1.5, delay: 0.0, usingSpringWithDamping: 0.2,
      initialSpringVelocity: 0.0,
      animations: {
        self.loginButton.bounds.size.width += 80.0
      },
      completion: {_ in
        self.showMessage(index: 0)
      }
    )

    UIView.animate(withDuration: 0.33, delay: 0.0, usingSpringWithDamping: 0.7,
      initialSpringVelocity: 0.0,
      animations: {
        self.loginButton.center.y += 60.0
     //   self.loginButton.backgroundColor = UIColor(red: 0.85, green: 0.83, blue: 0.45, alpha: 1.0)
        self.spinner.center = CGPoint(x: 40.0, y: self.loginButton.frame.size.height/2)
        self.spinner.alpha = 1.0
      },
      completion: nil
    )
    
    let tincColor = UIColor(red: 0.85, green: 0.83, blue: 0.45, alpha: 1.0)
    tintBackgroundColor(layer: loginButton.layer, toColor:
        tincColor)
    roundCorners(layer: loginButton.layer, toRadius: 25.0)
  } //      @IBAction func login()

    
    
  func animateCloud(layer: CALayer) {
    let cloudSpeed = 60.0 / TimeInterval(view.frame.size.width)
    let duration: TimeInterval = TimeInterval(view.frame.size.width - layer.frame.origin.x) * cloudSpeed
    let cloudMove = CABasicAnimation(keyPath: "position.x")
    cloudMove.delegate = self
    cloudMove.duration = duration
    cloudMove.toValue = view.bounds.width + layer.bounds.width / 2
    cloudMove.delegate = self
    cloudMove.setValue("cloud", forKey: "name")
    cloudMove.setValue(layer, forKey: "layer")
    layer.add( cloudMove, forKey: nil)
    
  }//  func animateCloud(_ cloud: UIImageView)


}


// MARK: UITextFieldDelegate
extension ViewControllerEightLayer: UITextFieldDelegate{
    
    /*
    override var next: UIResponder?{
        get{
            return super.next
            
        }
    }*/
    
    

func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    let nextField = (textField === username) ? password : username
    nextField?.becomeFirstResponder()
    
    if textField.text == "1" {
        self.navigationController?.setNavigationBarHidden(false, animated: true )

        tabBarViewController.tabBar.isHidden = false
    }
    else{
        self.navigationController?.setNavigationBarHidden(true, animated: true )

          tabBarViewController.tabBar.isHidden = true
    }
    return true
}//     textFieldShouldReturn

    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        guard let runningAnimations = infoLabel.layer.animationKeys() else {
            return
        }
        print(runningAnimations)
        infoLabel.layer.removeAnimation(forKey: "infoappear")
     //   infoLabel.frame.origin.x = 0
    }
    

}



extension ViewControllerEightLayer{
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}





extension ViewControllerEightLayer: CAAnimationDelegate{
    
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool){
        print("\n\nanimation did finish")
        
        guard let name = anim.value(forKey: "name") as? String else {
            return
        }
        
        if name == "form"{
            let layer = anim.value(forKey: "layer") as? CALayer
            anim.setValue(nil, forKey: "layer")
            // 上两行， 保证了 一次性使用
            
            let pulse = CABasicAnimation(keyPath: "transform.scale")
            pulse.fromValue = 1.25
            pulse.toValue = 1.0
            pulse.duration = 0.25
            layer?.add(pulse, forKey: nil)
            /*
             Note that you’re using optional chaining here with layer? — that means the add(_:forKey:) call will be skipped if there isn’t a layer stored in the animation. And since you set the layer to nil earlier, this pulse animation will only happen the first time the form field flies in from the right.
             */
        }
        else if name == "cloud"{
            let layer = anim.value(forKey: "layer") as? CALayer
            layer?.position.x =  -(layer?.bounds.size.width)!/2
            delay(0.5, completion: {
                self.animateCloud(layer: layer!)
            })
            
        }

    }// func animationDidStop(_ anim: CAAnimation, finished flag: Bool)
    
    
}








