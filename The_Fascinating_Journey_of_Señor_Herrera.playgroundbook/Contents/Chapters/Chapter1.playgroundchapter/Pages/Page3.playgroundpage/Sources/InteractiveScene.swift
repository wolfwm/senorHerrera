import Foundation
import UIKit
import PlaygroundSupport
import AVFoundation

public class SmithingViewController : UIViewController {
    
    var strikeButton : UIButton!
    
    var screenWidth: CGFloat = UIScreen.main.bounds.width
    
    var screenHeight: CGFloat = UIScreen.main.bounds.height
    
    var herreraView: UIImageView!
    
    var anvilView : UIImageView!
    
    var hammerView: UIImageView!
    
    let anvil = UIImage(named: "anvil.png")
    
    let herrera = UIImage(named: "herreraHot.png")
    
    let hammer = UIImage(named: "hammer.png")
    
    let herreraScale : CGFloat = 0.09
    
    let anvilScale : CGFloat = 0.09
    
    let hammerScale : CGFloat = 0.05
    
    var player : AVAudioPlayer?
    
    private var flag : Bool = true
    
    override public func loadView() {
        
        let view = UIView()
        view.backgroundColor = .white
        
        herreraView = UIImageView(image: herrera)
        
        anvilView = UIImageView(image: anvil)
        
        hammerView = UIImageView(image: hammer)
        
        strikeButton = UIButton(type: .system)
        strikeButton.setTitle("Strike!", for: .normal)
        strikeButton.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        strikeButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        strikeButton.addTarget(self, action: #selector(strike), for: .touchUpInside)
        //        strikeButton.titleLabel?.adjustsFontSizeToFitWidth = true
        //        strikeButton.titleLabel?.numberOfLines = 0
        //        strikeButton.frame = CGRect(x: screenWidth * 2 / 3, y: screenHeight * 2 / 3, width: anvilView.frame.width * anvilScale / 2, height: anvilView.frame.height * anvilScale / 2)
        
        //        herreraView.frame = CGRect(x: screenWidth / 2 - (herreraView.frame.width * herreraScale / 2), y: screenHeight / 2 - (herreraView.frame.height * herreraScale / 2), width: herreraView.frame.width * herreraScale, height: herreraView.frame.height * herreraScale)
        
        //        anvilView.frame = CGRect(x: screenWidth / 2 - (anvilView.frame.width * anvilScale * 8 / 9), y: screenHeight / 2, width: anvilView.frame.width * anvilScale, height: anvilView.frame.height * anvilScale)
        
        //        hammerView.frame = CGRect(x: screenWidth / 2 - (hammerView.frame.width * hammerScale / 2), y: screenHeight / 2 - (hammerView.frame.height * hammerScale * 4 / 5), width: hammerView.frame.width * hammerScale, height: hammerView.frame.height * hammerScale)
        
        view.addSubview(strikeButton)
        
        view.addSubview(anvilView)
        
        view.addSubview(herreraView)
        
        view.addSubview(hammerView)
        
        strikeButton.translatesAutoresizingMaskIntoConstraints = false
        strikeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        strikeButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        strikeButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        strikeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        herreraView.translatesAutoresizingMaskIntoConstraints = false
        herreraView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 50).isActive = true
        herreraView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 10).isActive = true
        herreraView.widthAnchor.constraint(equalToConstant: herreraView.frame.width * herreraScale).isActive = true
        herreraView.heightAnchor.constraint(equalToConstant: herreraView.frame.height * herreraScale).isActive = true
        
        herreraView.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/2)
        
        anvilView.translatesAutoresizingMaskIntoConstraints = false
        anvilView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -10).isActive = true
        anvilView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50).isActive = true
        anvilView.widthAnchor.constraint(equalToConstant: anvilView.frame.width * anvilScale).isActive = true
        anvilView.heightAnchor.constraint(equalToConstant: anvilView.frame.height * anvilScale).isActive = true
        
        hammerView.translatesAutoresizingMaskIntoConstraints = false
        hammerView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 50).isActive = true
        hammerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30).isActive = true
        hammerView.widthAnchor.constraint(equalToConstant: hammerView.frame.width * hammerScale).isActive = true
        hammerView.heightAnchor.constraint(equalToConstant: hammerView.frame.height * hammerScale).isActive = true
        
        hammerView.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/3)
        
        self.view = view
    }
    
    @objc public func strike() {
        UIView.animate(withDuration: 0.3, delay: 0.0, options: UIView.AnimationOptions.autoreverse, animations: {
            self.hammerView.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/2)
            let path = Bundle.main.path(forResource: "hammerStrike.wav", ofType: nil)!
            let url = URL(fileURLWithPath: path)
            do{
                self.player = try AVAudioPlayer(contentsOf: url)
                self.player?.play()
                
            }catch{
                print("problem with AVFoundation")
            }
        }, completion: { _ in
            self.hammerView.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/3)
            
        })
    }
}
