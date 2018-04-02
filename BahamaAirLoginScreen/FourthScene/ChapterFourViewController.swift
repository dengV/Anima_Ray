

import UIKit
import QuartzCore

// A delay function
func delay(seconds: Double, completion: @escaping ()-> Void) {
  DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: completion)
}

class ChapterFourViewController: UIViewController {
    
    enum AnimationDirection: Int{
        case positive = 1
        case negative = -1
    }
    
    
    
  
  @IBOutlet var bgImageView: UIImageView!
  
  @IBOutlet var summaryIcon: UIImageView!
  @IBOutlet var summary: UILabel!
  
  @IBOutlet var flightNr: UILabel!
  @IBOutlet var gateNr: UILabel!
  @IBOutlet var departingFrom: UILabel!
  @IBOutlet var arrivingTo: UILabel!
  @IBOutlet var planeImage: UIImageView!
  
  @IBOutlet var flightStatus: UILabel!
  @IBOutlet var statusBanner: UIImageView!
  
  var snowView: SnowView!
  
  //MARK: view controller methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //adjust ui
    summary.addSubview(summaryIcon)
    summaryIcon.center.y = summary.frame.size.height/2
    
    //add the snow effect layer
    snowView = SnowView(frame: CGRect(x: -150, y:-100, width: 300, height: 50))
    let snowClipView = UIView(frame: view.frame.offsetBy(dx: 0, dy: 50))
    snowClipView.clipsToBounds = true
    snowClipView.addSubview(snowView)
    view.addSubview(snowClipView)
    
    //start rotating the flights
    changeFlight(to: londonToParis)
  }
  
  //MARK: custom methods
  
    func changeFlight(to data:FlightData, animated:Bool = false){
/*  Above, you supply a default value of false for the new animated parameter so that
    existing calls to this method work as they did before, with no animation.     */
    // populate the UI with the next flight's data
    summary.text = data.summary
    
        
        if animated {
            fade(imageView: bgImageView, toImage: UIImage(named: data.weatherImageName)!, showEffects: data.showWeatherEffects , data_dng: data  )
            let direction: AnimationDirection = data.isTakingOff ? .positive : .negative
            cubeTransition(label: flightNr, textNew: data.flightNr, direction: direction)
            cubeTransition(label: gateNr, textNew: data.gateNr, direction: direction)
        }
        else{
            bgImageView.image = UIImage(named: data.weatherImageName)
            snowView.isHidden = !data.showWeatherEffects
            
            flightNr.text = data.flightNr
            gateNr.text = data.gateNr
            departingFrom.text = data.departingFrom
            arrivingTo.text = data.arrivingTo
            flightStatus.text = data.flightStatus
        }
    
    
    // schedule next flight
    delay(seconds: 3.0) {
     // self.changeFlight(to: data.isTakingOff ? parisToRome : londonToParis)
        self.changeFlight(to: data.isTakingOff ? londonToParis : parisToRome, animated: true)
        // parisToRome , londonToParis ,自带 isTakingOff 的 BOOL 值
    }
  }

    
    //MARK: - funcs
    
    func fade(imageView: UIImageView, toImage: UIImage , showEffects: Bool, data_dng:FlightData){
        UIView.transition(with: imageView, duration: 1.0, options: .transitionCrossDissolve, animations: {
            imageView.image = toImage
            self.flightStatus.text = data_dng.flightStatus
        }) { _ in        }
    
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseOut, animations: {
            self.snowView.alpha = showEffects ? 1.0 : 0.0
        }) { _ in        }
    
    }
    
    
    
    func cubeTransition(label: UILabel, textNew: String, direction: AnimationDirection){
        let auxLable = UILabel(frame: label.frame)
        auxLable.text = textNew
        auxLable.font = label.font
        auxLable.textAlignment = label.textAlignment
        auxLable.textColor = label.textColor
        auxLable.backgroundColor = label.backgroundColor
        
        let auxLabelOffset = CGFloat(direction.rawValue) * label.frame.size.height/2.0
        auxLable.transform = CGAffineTransform(translationX: 0.0, y: auxLabelOffset).scaledBy(x: 1.0, y: 0.1)
        label.superview?.addSubview(auxLable)
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut, animations: {
            auxLable.transform = .identity
            label.transform = CGAffineTransform(translationX: 0.0, y: -auxLabelOffset).scaledBy(x: 1.0, y: 0.1)
        }) { _ in
            label.text = auxLable.text
            label.transform = .identity
            auxLable.removeFromSuperview() // 不停的动画，不停地创建， 代码明显 可以优化
        }
    }
/*
     CGAffineTransformIdentity does reset a view or layer to its original, untransformed state, and thus cannot be redefined.
     But if you want your "personal" reset transform, e.g. with a different scale, why don't you simply define it, e.g. by using CGAffineTransform myCGAffineTransformIdentity = CGAffineTransform CGAffineTransformMakeScale (sx,sy);, and apply it to your views?
     */
    
    
    func moveLabel(label: UILabel, text: String, offset: CGPoint){
        // auxiliary
        let auxLabel = UILabel(frame: label.frame)
        auxLabel.text = text
        auxLabel.font = label.font
        auxLabel.textAlignment = label.textAlignment
        auxLabel.textColor = label.textColor
        auxLabel.backgroundColor = .clear
        
        auxLabel.transform = CGAffineTransform(translationX: offset.x, y: offset.y)
        auxLabel.alpha = 0
        view.addSubview(auxLabel)
    }
/*
     Declaration
     init(translationX tx: CGFloat,
     y ty: CGFloat)
     Parameters
     tx
     The value by which to move the x-axis of the coordinate system.
     
     ty
     The value by which to move the y-axis of the coordinate system.
     
     Return Value
     A new affine transform matrix.
     
     Discussion
     This function creates a CGAffineTransform structure. which you can use (and reuse, if you want) to move a coordinate system. The matrix takes the following form:
     

     */
    
}
