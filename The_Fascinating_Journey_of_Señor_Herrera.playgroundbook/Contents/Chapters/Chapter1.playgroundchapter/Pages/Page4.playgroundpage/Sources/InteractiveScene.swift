import Foundation
import UIKit
import PlaygroundSupport
import AVFoundation

public class SmithingViewController : UIViewController {
    
    var screenWidth: CGFloat = UIScreen.main.bounds.width
    
    var screenHeight: CGFloat = UIScreen.main.bounds.height
    
    var herreraView: UIImageView!
    
    var quenchingVesselBackView : UIImageView!
    
    var quenchingVesselFrontView: UIImageView!
    
    var steamView: UIImageView!
    
    var herreraIsHeld : Bool = false
    
    let quenchingVesselBack = UIImage(named: "quenchingVesselBack.png")
    
    let herrera = UIImage(named: "herreraHot.png")
    
    let herreraCold = UIImage(named: "spadinsky.png")
    
    let quenchingVesselFront = UIImage(named: "quenchingVesselFront.png")
    
    let steam = UIImage(named: "steam.png")
    
    let herreraScale : CGFloat = 0.08
    
    let quenchingVesselScale : CGFloat = 0.1
    
    let steamScale: CGFloat = 0.1
    
    var player : AVAudioPlayer?
    
    override public func loadView() {
        
        let view = UIView()
        view.backgroundColor = .white
        
        herreraView = UIImageView(image: herrera)
        
        quenchingVesselBackView = UIImageView(image: quenchingVesselBack)
        
        quenchingVesselFrontView = UIImageView(image: quenchingVesselFront)
        
        steamView = UIImageView(image: steam)
        
        //        herreraView.frame = CGRect(x: screenWidth/2 - (herreraView.frame.width * herreraScale / 2), y: screenHeight / 3 - (herreraView.frame.height * herreraScale / 2), width: herreraView.frame.width * herreraScale, height: herreraView.frame.height * herreraScale)
        
        //        quenchingVesselBackView.frame = CGRect(x: screenWidth/2 - (quenchingVesselBackView.frame.width * quenchingVesselScale / 2), y: screenHeight * 2 / 3 - (quenchingVesselBackView.frame.height * quenchingVesselScale / 2) - (quenchingVesselFrontView.frame.height * quenchingVesselScale / 22), width: quenchingVesselBackView.frame.width * quenchingVesselScale, height: quenchingVesselBackView.frame.height * quenchingVesselScale)
        
        //        quenchingVesselFrontView.frame = CGRect(x: screenWidth/2 - (quenchingVesselFrontView.frame.width * quenchingVesselScale / 2), y: screenHeight * 2 / 3 - (quenchingVesselFrontView.frame.height * quenchingVesselScale / 2), width: quenchingVesselFrontView.frame.width * quenchingVesselScale, height: quenchingVesselFrontView.frame.height * quenchingVesselScale)
        
        //        steamView.frame = CGRect(x: screenWidth/2 - (steamView.frame.width * steamScale / 2), y: screenHeight/2 - (steamView.frame.height * steamScale / 2), width: steamView.frame.width * steamScale, height: steamView.frame.height * steamScale)
        
        view.addSubview(quenchingVesselBackView)
        
        view.addSubview(herreraView)
        
        view.addSubview(quenchingVesselFrontView)
        
        herreraView.translatesAutoresizingMaskIntoConstraints = false
        herreraView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        herreraView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        herreraView.widthAnchor.constraint(equalToConstant: herreraView.frame.width * herreraScale).isActive = true
        herreraView.heightAnchor.constraint(equalToConstant: herreraView.frame.height * herreraScale).isActive = true
        
        herreraView.transform = CGAffineTransform(rotationAngle: -CGFloat.pi)
        
        quenchingVesselBackView.translatesAutoresizingMaskIntoConstraints = false
        quenchingVesselBackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        quenchingVesselBackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -210).isActive = true
        quenchingVesselBackView.widthAnchor.constraint(equalToConstant: quenchingVesselBackView.frame.width * quenchingVesselScale).isActive = true
        quenchingVesselBackView.heightAnchor.constraint(equalToConstant: quenchingVesselBackView.frame.height * quenchingVesselScale).isActive = true
        
        quenchingVesselFrontView.translatesAutoresizingMaskIntoConstraints = false
        quenchingVesselFrontView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        quenchingVesselFrontView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200).isActive = true
        quenchingVesselFrontView.widthAnchor.constraint(equalToConstant: quenchingVesselFrontView.frame.width * quenchingVesselScale).isActive = true
        quenchingVesselFrontView.heightAnchor.constraint(equalToConstant: quenchingVesselFrontView.frame.height * quenchingVesselScale).isActive = true
        
        self.view = view
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if herreraView.frame.contains(touches.first!.location(in: view)) {
            herreraIsHeld = true
        }
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if herreraIsHeld {
            herreraView.frame = CGRect(x: touches.first!.location(in: view).x-(herreraView.frame.width*0.5), y: touches.first!.location(in: view).y-(herreraView.frame.height/2), width: herreraView.frame.width, height: herreraView.frame.height)
            if quenchingVesselFrontView.frame.contains(touches.first!.location(in: view)) && herreraView.image != herreraCold {
                
                let path = Bundle.main.path(forResource: "steamSizzle.wav", ofType: nil)!
                let url = URL(fileURLWithPath: path)
                do{
                    self.player = try AVAudioPlayer(contentsOf: url)
                    self.player?.play()
                    
                }catch{
                    print("problem with AVFoundation")
                }
                
                view.addSubview(steamView)
                
                steamView.translatesAutoresizingMaskIntoConstraints = false
                steamView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
                steamView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -380).isActive = true
                steamView.widthAnchor.constraint(equalToConstant: steamView.frame.width * steamScale).isActive = true
                steamView.heightAnchor.constraint(equalToConstant: steamView.frame.height * steamScale).isActive = true
                
                herreraView.image = herreraCold
                herreraView.frame = CGRect(x: touches.first!.location(in: view).x-(herreraView.frame.width*0.7), y: touches.first!.location(in: view).y-(herreraView.frame.height/2), width: herreraView.frame.width * 1.4, height: herreraView.frame.height)
                
                herreraView.widthAnchor.constraint(equalToConstant: herreraView.frame.width).isActive = true
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
