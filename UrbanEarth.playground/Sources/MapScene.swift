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

public class MapScene: SCNScene {
    public let mapPlane = SCNNode()

    override public init() {
        super.init()
        
        // Map Plane
        
        mapPlane.geometry = SCNPlane(width: 8, height: 5)
        mapPlane.geometry?.firstMaterial?.diffuse.contents = #imageLiteral(resourceName: "map.png")
        
        mapPlane.geometry?.firstMaterial?.isDoubleSided = true
        self.rootNode.addChildNode(mapPlane)
        
        //mapPlane.isHidden = true
        
        
        ///////////////////////////////////////////
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
