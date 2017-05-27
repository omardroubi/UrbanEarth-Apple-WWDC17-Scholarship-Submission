/*
 Playground made by OMAR DROUBI on March 31st, 2017
 
 All classes and resources were self made and the music used is labeled for reuse and has a Creative Commons Attribution license: “Solar Symphony Part 4” by original Composer “Michael J. Burkard”.

 
 Apple WWDC 2017 Scholarship Submission
 
 This playground shows the air pollution (Micograms per cubic meter of Particulate matter/Nitrogen Dioxide) in the cities and countries around the world according to ©2017 The World Bank Group.
 www.worldbank.org
 
 The playground's purpose is to raise awareness among people about our environment and our health in the most visually interactive way.
 */


import UIKit
import PlaygroundSupport
import SceneKit
import AVFoundation



///////////////////////////////////////
//         PULSE ANIMATION           //
///////////////////////////////////////



public class PulseAnimation: CALayer {
    
    
    
    
    public var numberOfPulses = Float.infinity
    
    public var initialPulseScale: Float = 0

    public var radius: CGFloat = 200

    
    
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    
    override public init(layer: Any) {
        super.init(layer: layer)
    }
    
    public var animationDuration: TimeInterval = 0.8
    
    public var animationGroup = CAAnimationGroup()

    public init (position: CGPoint) {
        super.init()
        
        self.backgroundColor = UIColor.red.cgColor
        self.contentsScale = UIScreen.main.scale
        self.opacity = 0
        self.radius = 200
        self.numberOfPulses = 1
        self.position = position
        
        self.bounds = CGRect(x: 0, y: 0, width: radius * 2, height: radius * 2)
        self.cornerRadius = radius
        
        
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            self.setupGroup()
            
            DispatchQueue.main.async {
                self.add(self.animationGroup, forKey: "pulse")
            }
        }
        
        
        
    }
    
    
    public func createAnimation () -> CABasicAnimation {
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale.xy")
        scaleAnimation.fromValue = NSNumber(value: initialPulseScale)
        scaleAnimation.toValue = NSNumber(value: 1)
        scaleAnimation.duration = animationDuration
        
        return scaleAnimation
    }
    
    public func createAnimation2() -> CAKeyframeAnimation {
        
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        opacityAnimation.duration = animationDuration
        opacityAnimation.values = [0.4, 0.8, 0]
        opacityAnimation.keyTimes = [0, 0.2, 1]
        
        
        return opacityAnimation
    }
    
    public func setupGroup() {
        self.animationGroup = CAAnimationGroup()
        self.animationGroup.duration = animationDuration
        self.animationGroup.repeatCount = numberOfPulses
        
        let defaultCurve = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
        self.animationGroup.timingFunction = defaultCurve
        
        self.animationGroup.animations = [createAnimation(), createAnimation2()]
        
        
    }
    
    
    
}
