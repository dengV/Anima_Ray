

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
    var mockStatusBanner: UILabel?
  
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
  
    func changeFlight(to dataDestination:FlightData, animated:Bool = false){
/*  Above, you supply a default value of false for the new animated parameter so that
    existing calls to this method work as they did before, with no animation.     */
    // populate the UI with the next flight's data
    summary.text = dataDestination.summary
    
        
        if animated {
            planeDepart() // Chapter 5 , key frame
            fade(imageView: bgImageView, toImage: UIImage(named: dataDestination.weatherImageName)!, showEffects: dataDestination.showWeatherEffects , data_dng: dataDestination  )
            let direction: AnimationDirection = dataDestination.isTakingOff ? .positive : .negative
            cubeTransition(label: flightNr, textNew: dataDestination.flightNr, direction: direction)
            cubeTransition(label: gateNr, textNew: dataDestination.gateNr, direction: direction)
            boardingAnimation(statusLabel: flightStatus, newText: dataDestination.flightStatus, direction: direction)
            let offsetDeparting = CGPoint(x:  CGFloat( direction.rawValue * 80), y: 0.0)
            moveLabel(label: departingFrom, text: dataDestination.departingFrom, offset: offsetDeparting)
            let offsetArriving = CGPoint(x: 0.0, y: CGFloat(direction.rawValue * 50))
            moveLabel(label: arrivingTo, text: dataDestination.arrivingTo, offset: offsetArriving)
        }
        else{
            bgImageView.image = UIImage(named: dataDestination.weatherImageName)
            snowView.isHidden = !dataDestination.showWeatherEffects
            
            flightNr.text = dataDestination.flightNr
            gateNr.text = dataDestination.gateNr
            departingFrom.text = dataDestination.departingFrom
            arrivingTo.text = dataDestination.arrivingTo
            flightStatus.text = dataDestination.flightStatus
        }
    
    
    // schedule next flight
    delay(seconds: 3.0) {
     // self.changeFlight(to: data.isTakingOff ? parisToRome : londonToParis)
        self.changeFlight(to: dataDestination.isTakingOff ? londonToParis : parisToRome, animated: true)
        // parisToRome , londonToParis ,自带 isTakingOff 的 BOOL 值
    }
  }

    
    //MARK: - funcs
    
    func fade(imageView: UIImageView, toImage: UIImage , showEffects: Bool, data_dng:FlightData){
        UIView.transition(with: imageView, duration: 1.0, options: .transitionCrossDissolve, animations: {
            imageView.image = toImage
          //  self.flightStatus.text = data_dng.flightStatus
            //     动画之间有干涉， 妈的， 代码是我加的
        }) { _ in        }
    
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseOut, animations: {
            self.snowView.alpha = showEffects ? 1.0 : 0.0
        }) { _ in        }
    
    }
    
// MARK:- Let us take flight
    
    func planeDepart(){
        let originCenter = planeImage.center
        UIView.animateKeyframes(withDuration: 1.5, delay: 0.0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25) {
                self.planeImage.center.x += 80.0
                self.planeImage.center.x -= 10.0
            }//Running the first keyframe sets in motion the code in the animations closure: the airplane moves 80 points to the right and 10 points up.
            
            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.4, animations: {
                self.planeImage.transform = CGAffineTransform(rotationAngle: -.pi/8)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                self.planeImage.center.x += 100.0
                self.planeImage.center.x -= 50.0
                self.planeImage.alpha = 0.0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.51, relativeDuration: 0.01, animations: {
                self.planeImage.transform = .identity
                self.planeImage.center = CGPoint(x: 0.0, y: originCenter.y)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.55, relativeDuration: 0.45, animations: {
                self.planeImage.alpha = 1.0
                self.planeImage.center = originCenter
            })
        }) { _ in        }  // UIViewKeyFrameAnimationOptions
        
        
        
        
        
    }
    
    
// MARK:- Challenge
    func boardingAnimation(statusLabel: UILabel, newText: String, direction: AnimationDirection){
        if mockStatusBanner == nil {
            mockStatusBanner = UILabel()
            mockStatusBanner!.font = statusLabel.font
            mockStatusBanner!.textAlignment = statusLabel.textAlignment
            mockStatusBanner!.backgroundColor = statusLabel.backgroundColor
           // mockStatusBanner?.backgroundColor = .yellow
            // 调试 需要
            mockStatusBanner!.textColor = statusLabel.textColor
        }
        mockStatusBanner!.frame = statusLabel.frame              // 经常 变换的
        mockStatusBanner!.text = newText              // 经常 变换的
        
        let offsetY = CGFloat(direction.rawValue) * statusLabel.frame.size.height / 2.0
        mockStatusBanner?.transform = CGAffineTransform(translationX: 0.0, y: offsetY).scaledBy(x: 1.0, y: 0.1)
        statusLabel.superview?.addSubview(mockStatusBanner!)
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .transitionFlipFromBottom, animations: {
            self.mockStatusBanner!.transform = .identity
            statusLabel.transform = CGAffineTransform(translationX: 0.0, y: -offsetY).scaledBy(x: 1.0, y: 0.1)
        }) { _ in
            statusLabel.text = self.mockStatusBanner!.text
            statusLabel.transform = .identity
            self.mockStatusBanner?.removeFromSuperview()
        }
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
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
            label.transform = CGAffineTransform(translationX: offset.x, y: offset.y)
            label.alpha = 0.0
        }) { _ in    }
        UIView.animate(withDuration: 0.25, delay: 0.1, options: .curveEaseIn, animations: {
            auxLabel.transform = .identity
            auxLabel.alpha = 1.0
        }) { _ in
            auxLabel.removeFromSuperview()
            label.text = text
            label.alpha = 1.0
            label.transform = .identity
        }
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
