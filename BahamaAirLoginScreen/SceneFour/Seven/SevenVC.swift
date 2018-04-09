

import UIKit

class SevenVC: UIViewController {
  
  //MARK: IB outlets
  
  @IBOutlet var tableView: UITableView!
  @IBOutlet var buttonMenu: UIButton!
  @IBOutlet var titleLabel: UILabel!
    
    // DNG
    
    @IBOutlet weak var lhsButtonMenu: UIButton!
    
  
    @IBOutlet weak var menuHeightConstraint: NSLayoutConstraint!
    
    
    
  //MARK: further class variables
  
  var slider: HorizontalItemList!
  var isMenuOpen = false
  var items: [Int] = [5, 6, 7]
  
  //MARK: class methods
  
  @IBAction func actionToggleMenu(_ sender: AnyObject) {
    isMenuOpen = !isMenuOpen
  /*
     titleLabel.superview?.constraints.forEach({ constraint in
        print(" -> \(constraint.description) \n")
        if constraint.firstItem === titleLabel && constraint.firstAttribute == .centerY{
            constraint.constant = isMenuOpen ? -80.0 : 0.0
        }
        else if constraint.firstItem === lhsButtonMenu && constraint.firstAttribute == .centerY{
            constraint.constant = isMenuOpen ? -80.0 : 0.0
        }
    })
     */
    
    titleLabel.superview?.constraints.forEach({ constraint in
        print(" -> \(constraint.description) \n")
        if constraint.firstItem === titleLabel && constraint.firstAttribute == .centerY{
            constraint.constant = isMenuOpen ? -80.0 : 0.0
            return
        }
    })
    
    
    menuHeightConstraint.constant = isMenuOpen ? 200.0 : 60.0
    titleLabel.text = isMenuOpen ? "Select Item" : "Pack List"
    UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 10.0, options: .curveEaseIn, animations: {
        self.view.layoutIfNeeded()
        let angel: CGFloat = self.isMenuOpen ? .pi/4.0 : 0.0
        self.buttonMenu.transform = CGAffineTransform(rotationAngle: angel)
    }) { _ in    } // withDuration: 6.0
   
    
    /*
    delay(0.75) {
        UIView.animate(withDuration: 0.5, animations: {
            let angel: CGFloat = self.isMenuOpen ? .pi/4.0 : 0.0
            self.buttonMenu.transform = CGAffineTransform(rotationAngle: angel)
        })
    }*/
  }
  
  func showItem(_ index: Int) {
    print("tapped item \(index)")
  }
    
    
}


let itemTitles = ["Icecream money", "Great weather", "Beach ball", "Swim suit for him", "Swim suit for her", "Beach games", "Ironing board", "Cocktail mood", "Sunglasses", "Flip flops"]

extension SevenVC: UITableViewDelegate, UITableViewDataSource {
  
  // MARK: View Controller methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.tableView?.rowHeight = 54.0
  }
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    

    
    
  // MARK: Table View methods
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
    cell.accessoryType = .none
    cell.textLabel?.text = itemTitles[items[indexPath.row]]
    cell.imageView?.image = UIImage(named: "summericons_100px_0\(items[indexPath.row]).png")
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    showItem(items[indexPath.row])
  }
  
}
