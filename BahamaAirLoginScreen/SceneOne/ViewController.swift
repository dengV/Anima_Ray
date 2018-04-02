
import UIKit

// A delay function
func delay(_ seconds: Double, completion: @escaping ()->Void) {
  DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: completion)
}

class ViewController: UIViewController {
  
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
  let statusImageView = UIImageView(image: UIImage(named: "banner"))
  let label = UILabel()
  let messages = ["Connecting ...", "Authorizing ...", "Sending credentials ...", "Failed"]
  
  var statusPosition = CGPoint.zero
    
  var cancelCloud = false
    
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
    
    statusImageView.isHidden = true
    statusImageView.center = loginButton.center
    view.addSubview(statusImageView)
    
    label.frame = CGRect(x: 0.0, y: 0.0, width: statusImageView.frame.size.width, height: statusImageView.frame.size.height)
    label.font = UIFont(name: "HelveticaNeue", size: 18.0)
    label.textColor = UIColor(red: 0.89, green: 0.38, blue: 0.0, alpha: 1.0)
    label.textAlignment = .center
    statusImageView.addSubview(label)
    statusPosition = statusImageView.center
  }
  
    
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    heading.center.x -= view.bounds.width
    username.center.x -= view.bounds.width
    password.center.x -= view.bounds.width
    cloud1.alpha = 0.0
    cloud2.alpha = 0.0
    cloud3.alpha = 0.0
    cloud4.alpha = 0.0
    loginButton.center.y += 30.0
    loginButton.alpha = 0.0
  }
    
    
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    UIView.animate(withDuration: 0.5) { //0.5
        self.heading.center.x += self.view.bounds.width
        
    }
    UIView.animate(withDuration: 0.5 , delay:  0.3, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.0, options:  .curveEaseOut, animations: {
       self.username.center.x += self.view.bounds.width
    }, completion: nil)
    // Duration:  0.5
    
    UIView.animate(withDuration: 0.5 , delay:  0.4, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.0, options:  .curveEaseOut, animations: {
        self.password.center.x += self.view.bounds.width
    }, completion: nil)
    
    //options: Lets you customize a number of aspects about your animation. You’ll learn more about this parameter later on, but for now you can pass an empty array [] to mean “no special options”.
/*
    UIView.animate(withDuration: 0.5, delay: 0.4, options: [.curveEaseOut ], animations: {
        self.password.center.x += self.view.bounds.width
    }){ isThis  in    }
    // Position and Size: bounds, frame, center
    */
    UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: [], animations: {
        self.loginButton.center.y -= 30.0
        self.loginButton.alpha = 1.0
    }, completion: nil)
    /*
     Change the duration to 3.0 and the damping to 0.1. This is just to let you observe the effect of your changes in slow motion instead of at normal speed.
     Build and run your project again; note how the opacity of the button changes as it moves up. This is because the spring behavior affects all properties you animate; in your case, this affects both the vertical position of the button and its alpha value.
     */
    UIView.animate(withDuration: 0.5, delay: 0.5, options: [.curveEaseOut ], animations: {
        self.cloud1.alpha = 1.0
    }){ isThis  in    }
    UIView.animate(withDuration: 0.5, delay: 0.7, options: [.curveEaseOut ], animations: {
        self.cloud2.alpha = 1.0
    }){ isThis  in    }
    UIView.animate(withDuration: 0.5, delay: 0.9, options: [.curveEaseOut ], animations: {
        self.cloud3.alpha = 1.0
    }){ isThis  in    }
    UIView.animate(withDuration: 0.5, delay: 1.1, options: [.curveEaseOut ], animations: {
        self.cloud4.alpha = 1.0
    }){ isThis  in    }
   
    animateCloud(cloud: cloud1)
    animateCloud(cloud: cloud2)
    animateCloud(cloud: cloud3)
    animateCloud(cloud: cloud4)
  }
  
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.cancelCloud = true
    }
    
    
    
    // MARK: Funcs
    
    func showMessage(index: Int){
        label.text = messages[index]
        //.transitionCurlDown
        UIView.transition(with: statusImageView, duration: 0.33, options: [.curveEaseOut, .transitionFlipFromBottom], animations: {
            self.statusImageView.isHidden = false
        }) { _ in  delay(2.0, completion: {
            if index < self.messages.count - 1{
                self.removeMessage(index: index)
            }
            else{
                self.resetForm()
            }
        })}// 0.33 , delay   2.0
    }
    
    
    
    func removeMessage(index: Int){
        UIView.animate(withDuration: 0.33, delay: 0.0, options: [], animations: {
            self.statusImageView.center.x += self.view.frame.size.width
        }) { (_) in
            self.statusImageView.isHidden = true
            self.statusImageView.center = self.statusPosition
            self.showMessage(index: index+1)
        }
    }
    
// MARK:- Challenge
    func resetForm(){
        UIView.transition(with: statusImageView, duration: 0.2, options: .transitionFlipFromTop, animations: {
            self.statusImageView.isHidden = true
            self.statusImageView.center = self.statusPosition
            
        }) { (isIt) in }
        
    /*    UIView.animate(withDuration: 0.3, delay: 0.2, options: [], animations: {
            
            self.loginButton.backgroundColor = UIColor(red: 0.63, green: 0.84, blue: 0.35, alpha: 1.0)
            
           // self.loginButton.frame.size.width -= 80.0
            self.loginButton.bounds.size.width -= 80.0
           // self.loginButton.center.y -= 60.0
            self.loginButton.frame.origin.y -= 60.0
            self.spinner.frame.origin = CGPoint(x: -20, y: 16)
            self.spinner.alpha = 0.0
        }) { (isOK) in        }*/
        UIView.animate(withDuration: 1.5, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.0, options: [], animations: {
            self.loginButton.bounds.size.width -= 80.0
            self.view.layoutIfNeeded()

        }){ (yes) in }
        UIView.animate(withDuration: 0.33, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: [], animations: {
            self.loginButton.center.y -= 60.0
            self.loginButton.backgroundColor = UIColor(red: 0.63, green: 0.84, blue: 0.35, alpha: 1.0)
            self.spinner.center = CGPoint(x: -20, y: -16)
            self.spinner.alpha = 0.0
            self.view.layoutIfNeeded()

        }){ (yes) in  }
    }
    
    
    
    func animateCloud(cloud: UIImageView){
        let kScreenWidth = view.frame.size.width
        let cloudSpeed = 60.0/kScreenWidth    // view , 计算出 一屏的 宽度
        // speed 的 倒数
        
        let duration = (kScreenWidth - cloud.frame.origin.x) * cloudSpeed
        UIView.animate(withDuration: TimeInterval(duration), delay: 0.05, options: .curveLinear, animations: {
            cloud.frame.origin.x = kScreenWidth
            print("Cloud is Swing")
            
        }) { (isThis) in
            cloud.frame.origin.x -= (kScreenWidth + cloud.frame.size.width)
            
            if(!self.cancelCloud){
                self.animateCloud(cloud: cloud)
            }
        }
    }
    
    
    
  // MARK: further methods
  
  @IBAction func login() {
    view.endEditing(true)
    UIView.animate(withDuration: 1.5, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.0, options: [], animations: {
        self.loginButton.bounds.size.width += 80.0
    }){ (yes) in
        self.showMessage(index: 0)
    }
    UIView.animate(withDuration: 0.33, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: [], animations: {
        self.loginButton.center.y += 60.0
        self.loginButton.backgroundColor = UIColor(red: 0.85, green: 0.93, blue: 0.45, alpha: 1.0)
        self.spinner.center = CGPoint(x: 40.0, y: self.loginButton.frame.size.height/2)
        self.spinner.alpha = 1.0
    }){ (yes) in  }
    
  }
    
    
    
    
    
    
    
    
    
    
    
    
  
  // MARK: UITextFieldDelegate
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    let nextField = (textField === username) ? password : username
    nextField?.becomeFirstResponder()
    return true
  }
  
}
