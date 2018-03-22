
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
  let status = UIImageView(image: UIImage(named: "banner"))
  let label = UILabel()
  let messages = ["Connecting ...", "Authorizing ...", "Sending credentials ...", "Failed"]
  
  var statusPosition = CGPoint.zero
  
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
   
  }
  
  // MARK: further methods
  
  @IBAction func login() {
    view.endEditing(true)
    UIView.animate(withDuration: 1.5, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.0, options: [], animations: {
        self.loginButton.bounds.size.width += 80.0
    }){ (yes) in  }
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
