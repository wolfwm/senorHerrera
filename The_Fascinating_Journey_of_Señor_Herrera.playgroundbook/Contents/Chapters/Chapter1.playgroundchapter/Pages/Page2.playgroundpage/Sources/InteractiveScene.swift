import Foundation
import UIKit
import PlaygroundSupport
import AVFoundation

public class SmithingViewController : UIViewController {
    
    var screenWidth: CGFloat = UIScreen.main.bounds.width
    
    var screenHeight: CGFloat = UIScreen.main.bounds.height
    
    var herreraView: UIImageView!
    
    var furnaceBackView : UIImageView!
    
    var furnaceFrontView: UIImageView!
    
    var herreraIsHeld : Bool = false
    
    let furnaceBack = UIImage(named: "furnaceBack.png")
    
    let herrera = UIImage(named: "herrera.png")
    
    let herreraHot = UIImage(named: "herreraHot.png")
    
    let furnaceFront = UIImage(named: "furnaceFront.png")
    
    let herreraScale : CGFloat = 0.08
    
    let furnaceScale : CGFloat = 0.1
    
    var player : AVAudioPlayer?
    
    override public func loadView() {
        
        let view = UIView()
        view.backgroundColor = .white
        
        herreraView = UIImageView(image: herrera)
        
        furnaceBackView = UIImageView(image: furnaceBack)
        
        furnaceFrontView = UIImageView(image: furnaceFront)
        
        //        herreraView.frame = CGRect(x: screenWidth * 0.75, y: screenHeight / 2 - (herreraView.frame.height * herreraScale / 2), width: herreraView.frame.width * herreraScale, height: herreraView.frame.height * herreraScale)
        
        //        furnaceBackView.frame = CGRect(x: screenWidth * 0.1, y: screenHeight / 2 - (furnaceBackView.frame.height * furnaceScale / 2), width: furnaceBackView.frame.width * furnaceScale, height: furnaceBackView.frame.height * furnaceScale)
        
        //        furnaceFrontView.frame = CGRect(x: screenWidth * 0.1, y: screenHeight / 2 - (furnaceFrontView.frame.height * furnaceScale / 2), width: furnaceFrontView.frame.width * furnaceScale, height: furnaceFrontView.frame.height * furnaceScale)
        
        view.addSubview(furnaceBackView)
        
        view.addSubview(herreraView)
        
        view.addSubview(furnaceFrontView)
        
        herreraView.translatesAutoresizingMaskIntoConstraints = false
        herreraView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -150).isActive = true
        herreraView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        herreraView.widthAnchor.constraint(equalToConstant: herreraView.frame.width * herreraScale).isActive = true
        herreraView.heightAnchor.constraint(equalToConstant: herreraView.frame.height * herreraScale).isActive = true
        
        herreraView.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/2)
        
        furnaceFrontView.translatesAutoresizingMaskIntoConstraints = false
        furnaceFrontView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        furnaceFrontView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        furnaceFrontView.widthAnchor.constraint(equalToConstant: furnaceFrontView.frame.width * furnaceScale).isActive = true
        furnaceFrontView.heightAnchor.constraint(equalToConstant: furnaceFrontView.frame.height * furnaceScale).isActive = true
        
        furnaceBackView.translatesAutoresizingMaskIntoConstraints = false
        furnaceBackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        furnaceBackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        furnaceBackView.widthAnchor.constraint(equalToConstant: furnaceBackView.frame.width * furnaceScale).isActive = true
        furnaceBackView.heightAnchor.constraint(equalToConstant: furnaceBackView.frame.height * furnaceScale).isActive = true
        
        self.view = view
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if herreraView.frame.contains(touches.first!.location(in: view)) {
            herreraIsHeld = true
        }
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if herreraIsHeld {
            herreraView.frame = CGRect(x: touches.first!.location(in: view).x-(herreraView.frame.width*0.7), y: touches.first!.location(in: view).y-(herreraView.frame.height/2), width: herreraView.frame.width, height: herreraView.frame.height)
            if furnaceFrontView.frame.contains(touches.first!.location(in: view)) && herreraView.image != herreraHot {
                let path = Bundle.main.path(forResource: "furnaceFlare.wav", ofType: nil)!
                let url = URL(fileURLWithPath: path)
                do{
                    player = try AVAudioPlayer(contentsOf: url)
                    player?.play()
                    
                }catch{
                    print("problem with AVFoundation")
                }
                herreraView.image = herreraHot
            }
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        herreraIsHeld = false
    }
    
    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        herreraIsHeld = false
    }
}
