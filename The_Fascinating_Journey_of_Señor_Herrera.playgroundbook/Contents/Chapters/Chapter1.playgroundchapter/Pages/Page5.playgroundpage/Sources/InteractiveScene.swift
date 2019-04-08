import Foundation
import UIKit
import PlaygroundSupport

public class SmithingViewController : UIViewController {
    
    var screenWidth: CGFloat = UIScreen.main.bounds.width
    
    var screenHeight: CGFloat = UIScreen.main.bounds.height
    
    override public func loadView() {
        
        let view = UIView()
        view.backgroundColor = .white
        
        let label = UILabel()
        
        let herrera = UIImage(named: "spadinsky.png")
        
        let herreraScale : CGFloat = 0.15
        
        let herreraView = UIImageView(image: herrera)
        
        //        herreraView.frame = CGRect(x: screenWidth / 2 - (herreraView.frame.width * herreraScale / 2), y: screenHeight / 2 - (herreraView.frame.height * herreraScale / 2), width: herreraView.frame.width * herreraScale, height: herreraView.frame.height * herreraScale)
        
        view.addSubview(herreraView)
        
        herreraView.translatesAutoresizingMaskIntoConstraints = false
        herreraView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        herreraView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        herreraView.widthAnchor.constraint(equalToConstant: herreraView.frame.width * herreraScale).isActive = true
        herreraView.heightAnchor.constraint(equalToConstant: herreraView.frame.height * herreraScale).isActive = true
        
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.frame = CGRect(x: screenWidth / 2 - (herreraView.frame.width * 5 / 2), y: screenHeight * 4 / 5, width: herreraView.frame.width * 5, height: herreraView.frame.width)
        
        label.font = UIFont(name: "Helvetica", size: 34)
        label.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        label.textAlignment = NSTextAlignment.center
        label.text = "Señor Herrera is very thankful to you!"
        label.adjustsFontSizeToFitWidth = true
        
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.widthAnchor.constraint(equalToConstant: 700).isActive = true
        label.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        self.view = view
    }
}
