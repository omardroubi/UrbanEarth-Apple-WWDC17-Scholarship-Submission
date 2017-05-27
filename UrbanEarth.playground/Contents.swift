/*
 Playground made by OMAR DROUBI on March 31st, 2017

 All classes and resources were self made and the music used is labeled for reuse and has a Creative Commons Attribution license: “Solar Symphony Part 4” by original Composer “Michael J. Burkard”.
 
 Apple WWDC 2017 Scholarship Submission
 
 This playground shows the air pollution (Micograms per cubic meter of Particulate matter/Nitrogen Dioxide) in the cities and countries around the world according to The World Bank Group.
 www.worldbank.org
 
 The playground's purpose is to raise awareness among people about our environment and our health in the most visually interactive way.
*/


import UIKit
import PlaygroundSupport
import SceneKit
import AVFoundation

let button: UIButton = UIButton(frame: CGRect(x: 190, y: 650, width: 130, height: 40))
button.setTitle("Continue", for: UIControlState.normal)
button.titleLabel?.textColor = UIColor.white
button.titleLabel!.font =  UIFont.systemFont(ofSize: 20, weight: UIFontWeightMedium)
button.backgroundColor = UIColor.red

let title: UILabel = UILabel(frame: CGRect(x: 0, y: 25, width: 500, height: 40))
title.textAlignment = .center
title.text = "A View of Our Suffocating Planet"
title.textColor = UIColor.white
title.font = UIFont.systemFont(ofSize: 25, weight: UIFontWeightBold)

let question = UILabel(frame: CGRect(x: 0, y: 583, width: 500, height: 40))
question.textAlignment = .center
question.font = UIFont.systemFont(ofSize: 25, weight: UIFontWeightThin)
question.text = "Are there any unpolluted places left on Earth?"
question.textColor = UIColor.white



let question2 = UILabel(frame: CGRect(x: 0, y: 610, width: 500, height: 40))
question2.textAlignment = .center
question2.font = UIFont.systemFont(ofSize: 15, weight: UIFontWeightUltraLight)
question2.text = "Each line represents a high value of air pollution in the city"
question2.textColor = UIColor.white


// Particulate Button
let particulateButton: UIButton = UIButton(frame: CGRect(x: 80, y: 10, width: 200, height: 50))
particulateButton.setTitle("Particulate Matter", for: UIControlState.normal)
particulateButton.titleLabel?.textColor = UIColor.white
particulateButton.titleLabel!.font =  UIFont.systemFont(ofSize: 20, weight: UIFontWeightBold)
particulateButton.backgroundColor = UIColor.black
particulateButton.isHidden = true
//LABEL ________
let underline1: UILabel = UILabel(frame: CGRect(x: 95, y: 27, width: 500, height: 40))
underline1.text = "________________"
underline1.textColor = UIColor.white
underline1.font = UIFont.systemFont(ofSize: 25, weight: UIFontWeightBold)


// Nitrogen Button
let nitrogenButton: UIButton = UIButton(frame: CGRect(x: 260, y: 10, width: 200, height: 50))
nitrogenButton.setTitle("Nitrogen Dioxide", for: UIControlState.normal)
nitrogenButton.titleLabel?.textColor = UIColor.white
nitrogenButton.titleLabel!.font =  UIFont.systemFont(ofSize: 20, weight: UIFontWeightUltraLight)
nitrogenButton.backgroundColor = UIColor.black
nitrogenButton.isHidden = true
// LABEL _______
let underline2: UILabel = UILabel(frame: CGRect(x: 288, y: 27, width: 500, height: 40))
underline2.text = "______________"

underline2.textColor = UIColor.white
underline2.font = UIFont.systemFont(ofSize: 25, weight: UIFontWeightUltraLight)

underline1.isHidden = true
underline2.isHidden = true


// add the home scene to the view
var sceneView = SCNView(frame: CGRect(x: 0, y: 90, width: 500, height: 500))
sceneView.backgroundColor = UIColor(red:0.2, green:0.28, blue:0.52, alpha:0)

var scene = HomeScene()
sceneView.scene = scene
scene.background.contents = #imageLiteral(resourceName: "Untitled-2BLACK.png")
scene.rotate()
sceneView.allowsCameraControl = true
sceneView.autoenablesDefaultLighting = true




// Use camera for zoom in and switch to map view
var cameraNode = SCNNode()

cameraNode.camera = SCNCamera()
cameraNode.position = SCNVector3(0, 0, 3.7)

scene.rootNode.addChildNode(cameraNode)
sceneView.pointOfView = cameraNode

//////////// PULSE when changing values /////////////////
let pulse = PulseAnimation(position: CGPoint(x: 500/2, y: 250))

sceneView.layer.insertSublayer(pulse, below: sceneView.layer)

// NEW TOOLS INSTALLED WHEN BUTTON IS PRESSED
// slider
public let slider = UISlider(frame: CGRect(x: 60, y: 610, width: 380, height: 40))

// zoom label
public let zoomLabel: UILabel = UILabel(frame: CGRect(x: 190, y: 640, width: 130, height: 40))

slider.isHidden = true
slider.tintColor = UIColor.red

zoomLabel.textAlignment = .center
zoomLabel.font = UIFont.systemFont(ofSize: 25, weight: UIFontWeightBold)
zoomLabel.text = "ZOOM"
zoomLabel.textColor = UIColor.white
zoomLabel.isHidden = true

slider.minimumValue = 1
slider.maximumValue = 5

slider.setValue(Float(3.7), animated: true)

// IN label
let outLabel: UILabel = UILabel(frame: CGRect(x: 350, y: 640, width: 130, height: 40))
outLabel.textAlignment = .center
outLabel.font = UIFont.systemFont(ofSize: 25, weight: UIFontWeightLight)
outLabel.text = "-"
outLabel.textColor = UIColor.white
outLabel.isHidden = true

// OUT label
let inLabel: UILabel = UILabel(frame: CGRect(x: 18, y: 640, width: 130, height: 40))
inLabel.textAlignment = .center
inLabel.font = UIFont.systemFont(ofSize: 25, weight: UIFontWeightLight)
inLabel.text = "+"
inLabel.textColor = UIColor.white
inLabel.isHidden = true


////////////////////////////////// MAP PLANE
// add the home scene to the view
var mapView = SCNView(frame: CGRect(x: 0, y: 90, width: 800, height: 500))
//mapView.backgroundColor = UIColor(red:0.2, green:0.28, blue:0.52, alpha:0)

var mapScene = MapScene()
mapView.scene = mapScene
mapView.allowsCameraControl = false
mapView.autoenablesDefaultLighting = true


// Use camera for zoom in and switch to map view
var mapCameraNode = SCNNode()

mapCameraNode.camera = SCNCamera()
mapCameraNode.position = SCNVector3(0, 0, 2)

mapScene.rootNode.addChildNode(mapCameraNode)
mapView.pointOfView = mapCameraNode


mapView.isHidden = true


//(x: 0, y: 90, width: 500, height: 500))

// ^ Button
let upButton: UIButton = UIButton(frame: CGRect(x: 70, y: 20, width: 200, height: 50))
upButton.setTitle("^", for: UIControlState.normal)
upButton.titleLabel?.textColor = UIColor.white
upButton.titleLabel!.font =  UIFont.systemFont(ofSize: 70, weight: UIFontWeightBold)

mapView.addSubview(upButton)

// > Button
let rightButton: UIButton = UIButton(frame: CGRect(x: 180, y: 200, width: 200, height: 50))
rightButton.setTitle(">", for: UIControlState.normal)
rightButton.titleLabel?.textColor = UIColor.white
rightButton.titleLabel!.font =  UIFont.systemFont(ofSize: 50, weight: UIFontWeightBold)

mapView.addSubview(rightButton)

// < Button
let leftButton: UIButton = UIButton(frame: CGRect(x:0, y: 200, width: 50, height: 50))
leftButton.setTitle("<", for: UIControlState.normal)
leftButton.titleLabel?.textColor = UIColor.white
leftButton.titleLabel!.font =  UIFont.systemFont(ofSize: 50, weight: UIFontWeightBold)

mapView.addSubview(leftButton)

// v Button
let downButton: UIButton = UIButton(frame: CGRect(x: 70, y: 450, width: 200, height: 50))
downButton.setTitle("v", for: UIControlState.normal)
downButton.titleLabel?.textColor = UIColor.white
downButton.titleLabel!.font =  UIFont.systemFont(ofSize: 50, weight: UIFontWeightBold)

mapView.addSubview(downButton)

////////////////////////////////////

////////////////////////////////// NITROGEN //////////////////////////////////////////////////////
let infoViewNitrogen = UIView(frame: CGRect(x: 310, y: 90, width: 200, height: 500))

infoViewNitrogen.backgroundColor = UIColor.black

infoViewNitrogen.isHidden = true


// CITY title label
let cityLabel: UILabel = UILabel(frame: CGRect(x: 5, y: 2, width: 80, height: 30))

cityLabel.font = UIFont.systemFont(ofSize: 16, weight: UIFontWeightBold)
cityLabel.text = "Top Cities"
cityLabel.textColor = UIColor.white

infoViewNitrogen.addSubview(cityLabel)

// POLLUTANT title label
let pollutantLabel: UILabel = UILabel(frame: CGRect(x: 100, y: 2, width: 130, height: 30))

pollutantLabel.font = UIFont.systemFont(ofSize: 16, weight: UIFontWeightBold)
pollutantLabel.text = "Index"
pollutantLabel.textColor = UIColor.white

infoViewNitrogen.addSubview(pollutantLabel)


var counter: Int = 0

for city in citiesNitrogen {
    
    if (city.1 >= 75) {
        counter += 20

    // CITY title label
    let cityName: UILabel = UILabel(frame: CGRect(x: 5, y: 2 + counter, width: 85, height: 40))
    cityName.font = UIFont.systemFont(ofSize: 14, weight: UIFontWeightLight)
    cityName.text = city.0
    cityName.textColor = UIColor.white
    
    infoViewNitrogen.addSubview(cityName)
    
    // POLLUTANT title label
    let pollutantIndex: UILabel = UILabel(frame: CGRect(x: 100, y: 5 + counter, width: 130, height: 40))
    pollutantIndex.font = UIFont.systemFont(ofSize: 14, weight: UIFontWeightLight)
    pollutantIndex.text = "\(city.1) mg/m^3"
    pollutantIndex.textColor = UIColor.white
    
    infoViewNitrogen.addSubview(pollutantIndex)
    }
    
}

////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////// PARTICULATE //////////////////////////////////////////////////////
let infoViewParticulate = UIView(frame: CGRect(x: 310, y: 90, width: 200, height: 500))

infoViewParticulate.backgroundColor = UIColor.black

infoViewParticulate.isHidden = true


// CITY title label
let cityLabel2: UILabel = UILabel(frame: CGRect(x: 5, y: 2, width: 80, height: 30))

cityLabel2.font = UIFont.systemFont(ofSize: 16, weight: UIFontWeightBold)
cityLabel2.text = "Top Cities"
cityLabel2.textColor = UIColor.white

infoViewParticulate.addSubview(cityLabel2)

// POLLUTANT title label
let pollutantLabel2: UILabel = UILabel(frame: CGRect(x: 100, y: 2, width: 130, height: 30))

pollutantLabel2.font = UIFont.systemFont(ofSize: 16, weight: UIFontWeightBold)
pollutantLabel2.text = "Index"
pollutantLabel2.textColor = UIColor.white

infoViewParticulate.addSubview(pollutantLabel2)


var counter2: Int = 0

for city in citiesParticulate {
    
    if (city.1 >= 75) {
        counter2 += 20
        
        // CITY title label
        let cityName: UILabel = UILabel(frame: CGRect(x: 5, y: 2 + counter2, width: 85, height: 40))
        cityName.font = UIFont.systemFont(ofSize: 14, weight: UIFontWeightLight)
        cityName.text = city.0
        cityName.textColor = UIColor.white
        
        infoViewParticulate.addSubview(cityName)
        
        // POLLUTANT title label
        let pollutantIndex: UILabel = UILabel(frame: CGRect(x: 100, y: 5 + counter2, width: 130, height: 40))
        pollutantIndex.font = UIFont.systemFont(ofSize: 14, weight: UIFontWeightLight)
        pollutantIndex.text = "\(city.1) mg/m^3"
        pollutantIndex.textColor = UIColor.white
        
        infoViewParticulate.addSubview(pollutantIndex)
    }
    
}
// AUDIO when pressing arrow button
var flickSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "flick", ofType: "mp3")!)

var flickPlayer = try AVAudioPlayer(contentsOf: flickSound as URL)

flickPlayer.prepareToPlay()

// AUDIO when pressing section button
var pressSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "beep", ofType: "mp3")!)

var pressPlayer = try AVAudioPlayer(contentsOf: pressSound as URL)

pressPlayer.prepareToPlay()

var checkZoomedMap: Bool = false

/////////////////////////////////////////////////////////////////////

class FirstView: UIView {
    
    var didChange: Bool = false


    override init(frame: CGRect) {
        
        super.init(frame: frame)
     
        self.backgroundColor = UIColor.black
        
        self.addSubview(title)
        self.addSubview(question)
        self.addSubview(question2)
        self.addSubview(button)
        self.addSubview(slider)
        self.addSubview(zoomLabel)
        self.addSubview(nitrogenButton)
        self.addSubview(particulateButton)
        self.addSubview(underline1)
        self.addSubview(underline2)
        self.addSubview(inLabel)
        self.addSubview(outLabel)

        upButton.addTarget(self, action: #selector(upPressed), for: .touchUpInside)
        downButton.addTarget(self, action: #selector(downPressed), for: .touchUpInside)
        leftButton.addTarget(self, action: #selector(leftPressed), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(rightPressed), for: .touchUpInside)

        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)

        slider.addTarget(self, action: #selector(sliderValueDidChange), for: .valueChanged)
        
        particulateButton.addTarget(self, action: #selector(particulatePressed), for: .touchUpInside)

        nitrogenButton.addTarget(self, action: #selector(nitrogenPressed), for: .touchUpInside)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func upPressed() {
        flickPlayer.play()

        if mapCameraNode.position.y <= 1 {
            mapCameraNode.position.y += 0.5
            mapView.pointOfView = mapCameraNode
        }
        
    }

    func downPressed() {
        flickPlayer.play()

        if mapCameraNode.position.y >= -1 {
            mapCameraNode.position.y -= 0.5
            mapView.pointOfView = mapCameraNode
        }
        
    }

    func leftPressed() {
        flickPlayer.play()

        if mapCameraNode.position.x >= -1.1 {
            mapCameraNode.position.x -= 0.5
            mapView.pointOfView = mapCameraNode
        }
        
    }

    func rightPressed() {
        flickPlayer.play()

        if mapCameraNode.position.x <= 4.1 {
            mapCameraNode.position.x += 0.5
            mapView.pointOfView = mapCameraNode
        }
        
    }

    func buttonPressed() {
        pressPlayer.play()

        //////////// PULSE when changing values /////////////////
        
        let positionAnimation: CGPoint = CGPoint(x: 500/2, y: 350)
        
        let pulse = PulseAnimation(position: positionAnimation)
        
        self.layer.insertSublayer(pulse, above: sceneView.layer)
        ///////////////////////////////////////////////////////

        title.removeFromSuperview()
        
        button.removeFromSuperview()
        question.removeFromSuperview()
        question2.removeFromSuperview()
        
        
        slider.isHidden = false
        zoomLabel.isHidden = false
        particulateButton.isHidden = false
        nitrogenButton.isHidden = false
        underline1.isHidden = false
        underline2.isHidden = false
        inLabel.isHidden = false
        outLabel.isHidden = false

    }
    
    func nitrogenPressed() {
        pressPlayer.play()

        nitrogenButton.titleLabel!.font =  UIFont.systemFont(ofSize: 20, weight: UIFontWeightBold)

        particulateButton.titleLabel!.font =  UIFont.systemFont(ofSize: 20, weight: UIFontWeightUltraLight)
        
        underline2.font = UIFont.systemFont(ofSize: 25, weight: UIFontWeightBold)
        underline1.font = UIFont.systemFont(ofSize: 25, weight: UIFontWeightUltraLight)


        //////////// PULSE when changing values /////////////////
        
        let positionAnimation: CGPoint = CGPoint(x: 500/2, y: 350)
        
        let pulse = PulseAnimation(position: positionAnimation)
        
        self.layer.insertSublayer(pulse, above: sceneView.layer)
        ///////////////////////////////////////////////////////
        
        
        nitrogenSelected = true
        
        if  checkZoomedMap == true {
            infoViewNitrogen.isHidden = false
            infoViewParticulate.isHidden = true
        }
        
        DispatchQueue.global(qos: .default).async {

            scene.showNitrogen()
            
            
            
        }
    }
    
    func particulatePressed() {
        pressPlayer.play()

        nitrogenSelected = false


        particulateButton.titleLabel!.font =  UIFont.systemFont(ofSize: 20, weight: UIFontWeightBold)

        nitrogenButton.titleLabel!.font =  UIFont.systemFont(ofSize: 20, weight: UIFontWeightUltraLight)

        underline2.font = UIFont.systemFont(ofSize: 25, weight: UIFontWeightUltraLight)
        underline1.font = UIFont.systemFont(ofSize: 25, weight: UIFontWeightBold)

        //////////// PULSE when changing values /////////////////
        let pulse = PulseAnimation(position: CGPoint(x: 500/2, y: 350))
        
        self.layer.insertSublayer(pulse, above: sceneView.layer)
        /////////////////////////////////////////////////////
        if  checkZoomedMap == true {
            infoViewNitrogen.isHidden = true
            
            infoViewParticulate.isHidden = false
        }
        
        DispatchQueue.global(qos: .default).async {


            
            scene.showParticulate()

        }
        
    }
    
    func sliderValueDidChange() {

        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            cameraNode.position.z = slider.value
            
            sceneView.pointOfView = cameraNode

            DispatchQueue.main.async {
                

                // TRANSFORM INTO MAP VIEW with countries when zoomed in
                if (cameraNode.position.z <= 2.6 && self.didChange == false) {
                    
                    checkZoomedMap = true
                    
                    mapView.isHidden = false
                    sceneView.isHidden = true
                    
                    if (nitrogenSelected == true) {
                        infoViewNitrogen.isHidden = false
                        infoViewParticulate.isHidden = true
                    } else {
                        infoViewNitrogen.isHidden = true
                        infoViewParticulate.isHidden = false
                    }
                    
                    mapCameraNode.position.z = slider.value
                    mapView.pointOfView = mapCameraNode
                    
                }
                    
                    
                    // Remove the mapView to show the globe again
                else if (cameraNode.position.z >= 2.6) {
                    
                    checkZoomedMap = false
                    
                    mapView.isHidden = true
                    sceneView.isHidden = false
                    infoViewNitrogen.isHidden = true
                    infoViewParticulate.isHidden = true
                    
                    
                    
                }
            }
        }
    
    }
}



let homeView = FirstView(frame: CGRect(x: 0, y: 0, width: 500, height: 700))

homeView.addSubview(sceneView)
homeView.addSubview(mapView)
homeView.addSubview(infoViewNitrogen)
homeView.addSubview(infoViewParticulate)

PlaygroundPage.current.liveView = homeView





// AUDIO in the back
var beepSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "music", ofType: "mp3")!)

var beepPlayer = try AVAudioPlayer(contentsOf: beepSound as URL)

beepPlayer.prepareToPlay()

beepPlayer.play()

beepPlayer.numberOfLoops = 1000000000000000000



