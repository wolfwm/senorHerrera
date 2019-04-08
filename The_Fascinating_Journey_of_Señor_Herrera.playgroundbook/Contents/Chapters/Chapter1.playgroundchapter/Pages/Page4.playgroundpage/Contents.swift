//#-hidden-code

import Foundation
import UIKit
import PlaygroundSupport

let window = UIWindow(frame : CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
window.rootViewController = SmithingViewController()
window.makeKeyAndVisible()

PlaygroundPage.current.liveView = window

//#-end-hidden-code

/*:
 Now that Señor Herrera is at the proper temperature and has the shape that we want, we should quench him
 
 Quenching is a heat treatment process through which a hot metal is rapidly cooled locking its structure in place and giving it strength.
 Quenching steel is typically done with oil, since if the temperature drop is too abrupt, the metal can warp and become weak.
 
 Let's try dipping Señoer Herrera in the quenching liquid to witness his transformation.
 */

//: [<Previous](@previous) | [Next >](@next)
