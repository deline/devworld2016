import Foundation
import UIKit

public class SecondController: UIViewController {
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        self.modalTransitionStyle = .FlipHorizontal
        
        self.view.backgroundColor = .whiteColor()
        
        let backButton = UIButton(frame: CGRectMake(0, 0, 44, 44))
        backButton.backgroundColor = .redColor()
        backButton.setTitle("BK", forState: .Normal)
        backButton.addTarget(self, action: #selector(SecondController.pop), forControlEvents: .TouchUpInside)
        self.view.addSubview(backButton)
    }
    
    func pop() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
