import UIKit
import AudioToolbox

class ViewController: UIViewController {
    @IBAction func playSound(sender:AnyObject){
        let soundUrl = NSBundle.mainBundle().URLForResource("test", withExtension: "aif")!
        var sound:SystemSoundID = 0
        AudioServicesCreateSystemSoundID(soundUrl, &sound)
        AudioServicesAddSystemSoundCompletion(sound, nil, nil, {
             sound, context in
                AudioServicesRemoveSystemSoundCompletion(sound)
                AudioServicesDisposeSystemSoundID(sound)
            }, nil)
        AudioServicesPlaySystemSound(sound)
    }
}

