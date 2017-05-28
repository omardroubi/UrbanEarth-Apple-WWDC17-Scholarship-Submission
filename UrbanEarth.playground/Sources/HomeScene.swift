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



public var shouldRotate: Bool = true

// if nitrogen is selected, show the array of Nitrogen Dioxide values
// else, show the array of particulate matter values
public var nitrogenSelected: Bool = false



// Array of the cities and their values
// (0: Name, 1: Air Pollution Number, 2: Latitude, 3: Longitude)


public var citiesNitrogen: [(String, Int, Float, Float)] = [("Cordoba, Argentina", 97, -31.4201, -64.1888),
                                                            ("Melbourne", 30, -37.8136, 144.9631),
                                                            ("Perth", 19, -31.9505, 115.8605),
                                                            ("Sydney", 81, -33.8688, 151.2093),
                                                            ("Vienna", 42, 48.2082, 16.3738),
                                                            ("Brussels", 48, 50.8503, 4.3517),
                                                            ("Sao Paulo", 83, -23.5505, -64.1888),
                                                            ("Sofia, Bulgaria", 122, 42.6977, 23.3219),
                                                            ("Montreal", 42, 45.5017, -79.3832),
                                                            ("Toronto", 43, 43.6532, -64.1888),
                                                            ("Vancouver", 37, 49.2827, -123.1207),
                                                            ("Santiago", 81, -33.4489, -70.6693),
                                                            ("Anshan", 88, 41.1086, 122.9943),
                                                            ("Beijing", 122, 39.9042, 116.4074),
                                                            ("Changchun", 64, 43.8171, 125.3235),
                                                            ("Chengdu", 74, 30.5728, 104.0668),
                                                            ("Chongqing", 70, 29.563009, 106.551559),
                                                            ("Dalian", 100, 38.9140, 121.6147),
                                                            ("Guangzhou", 136, 23.1291, 113.2644),
                                                            ("Guiyang", 53, 26.6477, 106.6302),
                                                            ("Harbin", 30, 45.8038, 126.5350),
                                                            ("Jinan", 45, 36.6512, 117.1200),
                                                            ("Kunming", 33, 24.8801, 102.8329),
                                                            ("Lanzhou", 104, 36.0611, 103.8343),
                                                            ("Nanchang", 29, 28.6829, 115.8582),
                                                            ("Quingdao", 64, 36.0671, 120.3826),
                                                            ("Shanghai", 73, 31.2304, 121.4737),
                                                            ("Shenyang", 73, 41.8057, 123.4315),
                                                            ("Taiyuan", 55, 37.8706, 112.5489),
                                                            ("Tianjin", 50, 39.0842, 117.2010),
                                                            ("Ürümqi", 70, 43.8256, 87.6168),
                                                            ("Wuhan", 43, 30.5931, 114.3054),
                                                            ("Zhengzhou", 95, 34.7466, 113.6253),
                                                            ("Zibo", 43, 36.8135, 118.0549),
                                                            ("Havana", 5, 23.1136, -82.3666),
                                                            ("Prague", 33, 50.0755, 14.4378),
                                                            ("Copenhagen", 54, 55.6761, 12.5683),
                                                            ("Helsinki", 35, 60.1699, 24.9384),
                                                            ("Paris", 57, 48.8566, 2.3522),
                                                            ("Berlin", 26, 52.5200, 13.4050),
                                                            ("Frankfurt", 45, 50.1109, 8.6821),
                                                            ("Munich", 53, 48.1351, 11.5820),
                                                            ("Athens", 64, 37.9838, 23.7275),
                                                            ("Budapest", 51, 47.4979, 19.0402),
                                                            ("Reykjavik", 42, 64.1265, -21.8174),
                                                            ("Ahmedabad", 21, 23.0225, 72.5714),
                                                            ("Madras", 34, 44.6335, 121.1295),
                                                            ("Delhi", 17, 28.7041, 77.1025),
                                                            ("Hyderabad", 41, 17.3850, 78.4867),
                                                            ("Kanpur", 17, 26.4499, 80.3319),
                                                            ("Lucknow", 14, 26.8467, 80.9462),
                                                            ("Mumbai", 25, 19.0760, 72.8777),
                                                            ("Nagpur", 13, 21.1458, -64.1888),
                                                            ("Milan", 248, 45.4654, 9.1859),
                                                            ("Osaka-Kobe", 63, 34.6937, 135.5022),
                                                            ("Tokyo", 68, 35.6895, 139.6917),
                                                            ("Yokohama", 13, 35.4437, 139.6380),
                                                            ("Busan", 51, 35.1796, 129.0756),
                                                            ("Seoul", 60, 37.5665, 126.9780),
                                                            ("Daegu", 62, 35.8714, 128.6014),
                                                            ("Mexico City", 130, 19.4326, -99.1332),
                                                            ("Amsterdam", 58, 52.3702, 4.8952),
                                                            ("Oslo", 20, 59.9139, 10.7522),
                                                            ("Manila", 43, 14.5995, 120.9842),
                                                            ("Lódz", 79, 51.7592, 19.4560),
                                                            ("Warsaw", 43, 52.2297, 21.0122),
                                                            ("Lisbon", 32, 38.7223, -9.1393),
                                                            ("Bucharest", 52, 44.4268, 26.1025),
                                                            ("Moscow", 71, 55.7558, 37.6173),
                                                            ("Singapore", 34, 1.3521, 103.8198),
                                                            ("Bratislava", 30, 48.1486, 17.1077),
                                                            ("Cape Town", 72, -33.9249, 18.4241),
                                                            ("Johannesburg", 31, -26.2041, 28.0473),
                                                            ("Barcelona", 43, 41.3851, 2.1734),
                                                            ("Madrid", 66, 40.4168, 3.7038),
                                                            ("Stockholm", 20, 59.3293, 18.0686),
                                                            ("Zurich", 39, 47.3769, 8.5417),
                                                            ("Bangkok", 23, 13.7563, 100.5018),
                                                            ("Ankara", 46, 39.9334, 32.8597),
                                                            ("Kiev", 51, 50.4501, 30.5234),
                                                            ("Birmingham", 45, 52.4862, -1.8904),
                                                            ("London", 77, 51.5074, -0.1278),
                                                            ("Manchester", 49, 53.4808, -2.2426),
                                                            ("Chicago", 57, 41.8781, -87.6298),
                                                            ("Los Angeles", 74, 34.0522, -118.2437),
                                                            ("New York", 79, 40.7128, -74.0059),
                                                            ("Caracas", 57, 10.4806, -66.9036)]




public var citiesParticulate: [(String, Int, Float, Float)] = [("Cordoba, Argentina", 58, -31.4201, -64.1888),
                                             ("Melbourne", 12, -37.8136, 144.9631),
                                             ("Perth", 12, -31.9505, 115.8605),
                                             ("Sydney", 20, -33.8688, 151.2093),
                                             ("Vienna", 41, 48.2082, 16.3738),
                                             ("Brussels", 28, 50.8503, 4.3517),
                                             ("Rio de Janeiro", 35, -22.9068, -46.6333),
                                             ("Sao Paulo", 40, -23.5505, -64.1888),
                                             ("Sofia, Bulgaria", 61, 42.6977, 23.3219),
                                             ("Montreal", 19, 45.5017, -79.3832),
                                             ("Toronto", 22, 43.6532, -64.1888),
                                             ("Vancouver", 13, 49.2827, -123.1207),
                                             ("Santiago", 61, -33.4489, -70.6693),
                                             ("Anshan", 82, 41.1086, 122.9943),
                                             ("Beijing", 89, 39.9042, 116.4074),
                                             ("Changchun", 74, 43.8171, 125.3235),
                                             ("Chengdu", 86, 30.5728, 104.0668),
                                             ("Chongqing", 123, 29.563009, 106.551559),
                                             ("Dalian", 50, 38.9140, 121.6147),
                                             ("Guangzhou", 63, 23.1291, 113.2644),
                                             ("Guiyang", 70, 26.6477, 106.6302),
                                             ("Harbin", 77, 45.8038, 126.5350),
                                             ("Jinan", 94, 36.6512, 117.1200),
                                             ("Kunming", 70, 24.8801, 102.8329),
                                             ("Lanzhou", 91, 36.0611, 103.8343),
                                             ("Liupanshui", 59, 26.5927, 104.8304),
                                             ("Nanchang", 78, 28.6829, 115.8582),
                                             ("Pingxiang", 67, 27.6228, 113.8546),
                                             ("Quingdao", 68, 36.0671, 120.3826),
                                             ("Shanghai", 73, 31.2304, 121.4737),
                                             ("Shenyang", 101, 41.8057, 123.4315),
                                             ("Taiyuan", 88, 37.8706, 112.5489),
                                             ("Tianjin", 125, 39.0842, 117.2010),
                                             ("Ürümqi", 57, 43.8256, 87.6168),
                                             ("Wuhan", 79, 30.5931, 114.3054),
                                             ("Zhengzhou", 97, 34.7466, 113.6253),
                                             ("Zibo", 74, 36.8135, 118.0549),
                                             ("Bogota", 31, 4.7110, -74.0721),
                                             ("Zagreb", 33, 45.8150, 15.9819),
                                             ("Havana", 21, 23.1136, -82.3666),
                                             ("Prague", 23, 50.0755, 14.4378),
                                             ("Copenhagen", 21, 55.6761, 12.5683),
                                             ("Guayaquil", 23, -2.1710, -79.9224),
                                             ("Quito", 30, -0.1807, -78.4678),
                                             ("Cairo", 169, 30.0444, 31.2357),
                                             ("Helsinki", 21, 60.1699, 24.9384),
                                             ("Paris", 11, 48.8566, 2.3522),
                                             ("Berlin", 22, 52.5200, 13.4050),
                                             ("Frankfurt", 19, 50.1109, 8.6821),
                                             ("Munich", 20, 48.1351, 11.5820),
                                             ("Accra", 33, 5.6037, 0.1870),
                                             ("Athens", 43, 37.9838, 23.7275),
                                             ("Budapest", 19, 47.4979, 19.0402),
                                             ("Reykjavik", 18, 64.1265, -21.8174),
                                             ("Ahmedabad", 83, 23.0225, 72.5714),
                                             ("Bangalore", 45, 12.9716, 77.5946),
                                             ("Kolkata", 128, 22.5726, 88.3639),
                                             ("Madras", 37, 44.6335, 121.1295),
                                             ("Delhi", 150, 28.7041, 77.1025),
                                             ("Hyderabad", 41, 17.3850, 78.4867),
                                             ("Kanpur", 109, 26.4499, 80.3319),
                                             ("Lucknow", 109, 26.8467, 80.9462),
                                             ("Mumbai", 63, 19.0760, 72.8777),
                                             ("Nagpur", 56, 21.1458, -64.1888),
                                             ("Pune", 47, 18.5204, 73.8567),
                                             ("Jakarta", 104, -6.1745, 106.8227),
                                             ("Tehran", 58, 35.6892, 51.3890),
                                             ("Dublin", 19, 53.3498, -6.2603),
                                             ("Milan", 30, 45.4654, 9.1859),
                                             ("Rome", 29, 41.9028, 12.4964),
                                             ("Turin", 44, 45.0703, 7.6869),
                                             ("Osaka-Kobe", 35, 34.6937, 135.5022),
                                             ("Tokyo", 40, 35.6895, 139.6917),
                                             ("Yokohama", 31, 35.4437, 139.6380),
                                             ("Nairobi", 43, -1.2921, 36.8219),
                                             ("Busan", 44, 35.1796, 129.0756),
                                             ("Seoul", 41, 37.5665, 126.9780),
                                             ("Daegu", 29, 35.8714, 128.6014),
                                             ("Kuala Lumpur", 29, 3.1390, 101.6869),
                                             ("Mexico City", 51, 19.4326, -99.1332),
                                             ("Amsterdam", 34, 52.3702, 4.8952),
                                             ("Oslo", 14, 59.9139, 10.7522),
                                             ("Manila", 39, 14.5995, 120.9842),
                                             ("Katowice", 39, 50.2649, 19.0238),
                                             ("Lódz", 39, 51.7592, 19.4560),
                                             ("Warsaw", 43, 52.2297, 21.0122),
                                             ("Lisbon", 23, 38.7223, -9.1393),
                                             ("Bucharest", 18, 44.4268, 26.1025),
                                             ("Moscow", 21, 55.7558, 37.6173),
                                             ("Omsk", 22, 54.9885, 73.3242),
                                             ("Singapore", 44, 1.3521, 103.8198),
                                             ("Bratislava", 15, 48.1486, 17.1077),
                                             ("Cape Town", 16, -33.9249, 18.4241),
                                             ("Durban", 32, -29.8587, 31.0218),
                                             ("Johannesburg", 33, -26.2041, 28.0473),
                                             ("Barcelona", 35, 41.3851, 2.1734),
                                             ("Madrid", 30, 40.4168, 3.7038),
                                             ("Stockholm", 11, 59.3293, 18.0686),
                                             ("Zurich", 23, 47.3769, 8.5417),
                                             ("Bangkok", 79, 13.7563, 100.5018),
                                             ("Ankara", 46, 39.9334, 32.8597),
                                             ("Istanbul", 55, 41.0082, 28.9784),
                                             ("Kiev", 35, 50.4501, 30.5234),
                                             ("Birmingham", 25, 52.4862, -1.8904),
                                             ("London", 21, 51.5074, -0.1278),
                                             ("Manchester", 15, 53.4808, -2.2426),
                                             ("Chicago", 25, 41.8781, -87.6298),
                                             ("Los Angeles", 34, 34.0522, -118.2437),
                                             ("New York", 21, 40.7128, -74.0059),
                                             ("Beirut", 29, 33.8938, 35.5018),
                                             ("Caracas", 10, 10.4806, -66.9036)]

public class HomeScene : SCNScene  {
    
    public let node = SCNNode()


    override public init() {
        super.init()
        
        // Earth Sphere
        node.geometry = SCNSphere(radius: 1.2)
        
        // IMAGE for colored map
        node.geometry?.firstMaterial?.diffuse.contents = #imageLiteral(resourceName: "earth_specularmap_flat_8192x4096.png")
        
        
        node.geometry?.firstMaterial?.isDoubleSided = true
        
        
        // rotate earth
        let action = SCNAction.rotate(by: 90*CGFloat((Double.pi)/180.0), around: SCNVector3(x:0, y:1, z:0), duration: 25)
        
        let repeatAction = SCNAction.repeatForever(action)
       
        node.runAction(repeatAction)

        
        self.rootNode.addChildNode(node)

        // Pyramids
                
        if (nitrogenSelected == false) {

            
            for city in citiesParticulate {
                let pyramid = SCNNode()
                
                var height: CGFloat = 0
                var color: UIColor = UIColor.white
                
                if (city.1 >= 0 && city.1 <= 49) {
                    height = 1.4
                    color = UIColor.white
                }
                else if (city.1 >= 50 && city.1 <= 89) {
                    height = 1.5
                    color = UIColor.white
                }
                else if (city.1 >= 90 && city.1 <= 119) {
                    height = 1.6
                    color = UIColor.red
                }
                else if (city.1 >= 120 && city.1 <= 129) {
                    height = 1.7
                    color = UIColor.red
                }
                else {
                    height = 1.9
                    color = UIColor.red
                }
                pyramid.geometry = SCNPyramid(width: 0.05, height: height, length: 0.05)
                pyramid.geometry?.firstMaterial?.diffuse.contents = color
                pyramid.geometry?.firstMaterial?.emission.contents = color
                pyramid.geometry?.firstMaterial?.ambient.contents = color
                pyramid.geometry?.firstMaterial?.reflective.contents = color
                
                
                pyramid.geometry?.firstMaterial?.isDoubleSided = true
                
                let latitude: Float = city.2
                let longitude: Float = city.3
                
                // Rotate according to latitude and longitude
                pyramid.eulerAngles = SCNVector3(x:(90-latitude) * Float((M_PI)/180.0), y:longitude * Float((M_PI)/180.0), z:0)
                
                
                self.node.addChildNode(pyramid)
            }
        }
        else {
            
            // Pyramids
            for city in citiesNitrogen {
                
                
                let pyramid = SCNNode()
                
                var height: CGFloat = 0
                var color: UIColor = UIColor.white
                
                if (city.1 >= 0 && city.1 <= 49) {
                    height = 1.4
                    color = UIColor.white
                }
                else if (city.1 >= 50 && city.1 <= 89) {
                    height = 1.5
                    color = UIColor.white
                }
                else if (city.1 >= 90 && city.1 <= 119) {
                    height = 1.6
                    color = UIColor.red
                }
                else if (city.1 >= 120 && city.1 <= 129) {
                    height = 1.7
                    color = UIColor.red
                }
                else {
                    height = 1.9
                    color = UIColor.red
                }
                pyramid.geometry = SCNPyramid(width: 0.05, height: height, length: 0.05)
                pyramid.geometry?.firstMaterial?.diffuse.contents = color
                pyramid.geometry?.firstMaterial?.emission.contents = color
                pyramid.geometry?.firstMaterial?.ambient.contents = color
                pyramid.geometry?.firstMaterial?.reflective.contents = color
                
                
                pyramid.geometry?.firstMaterial?.isDoubleSided = true
                
                let latitude: Float = city.2
                let longitude: Float = city.3
                
                // Rotate according to latitude and longitude
                pyramid.eulerAngles = SCNVector3(x:(90-latitude) * Float((M_PI)/180.0), y:longitude * Float((M_PI)/180.0), z:0)
                
                
                self.node.addChildNode(pyramid)
            }

        }
        
    }
    
    public func showNitrogen() {

        for child in self.node.childNodes {
            child.removeFromParentNode()
        }

        // Pyramids
        for city in citiesNitrogen {
            
            
            let pyramid = SCNNode()
            
            var height: CGFloat = 0
            var color: UIColor = UIColor.white
            
            if (city.1 >= 0 && city.1 <= 49) {
                height = 1.4
                color = UIColor.white
            }
            else if (city.1 >= 50 && city.1 <= 89) {
                height = 1.5
                color = UIColor.white
            }
            else if (city.1 >= 90 && city.1 <= 119) {
                height = 1.6
                color = UIColor.red
            }
            else if (city.1 >= 120 && city.1 <= 129) {
                height = 1.7
                color = UIColor.red
            }
            else {
                height = 1.9
                color = UIColor.red
            }
            pyramid.geometry = SCNPyramid(width: 0.05, height: height, length: 0.05)
            pyramid.geometry?.firstMaterial?.diffuse.contents = color
            pyramid.geometry?.firstMaterial?.emission.contents = color
            pyramid.geometry?.firstMaterial?.ambient.contents = color
            pyramid.geometry?.firstMaterial?.reflective.contents = color
            
            
            pyramid.geometry?.firstMaterial?.isDoubleSided = true
            
            let latitude: Float = city.2
            let longitude: Float = city.3
            
            // Rotate according to latitude and longitude
            pyramid.eulerAngles = SCNVector3(x:(90-latitude) * Float((M_PI)/180.0), y:longitude * Float((M_PI)/180.0), z:0)
            
            
            self.node.addChildNode(pyramid)
        }
        
        
    }

    public func showParticulate() {
        for child in self.node.childNodes {
            child.removeFromParentNode()
        }
        // Pyramids
        for city in citiesParticulate {
            
            
            let pyramid = SCNNode()
            
            var height: CGFloat = 0
            var color: UIColor = UIColor.white
            
            if (city.1 >= 0 && city.1 <= 49) {
                height = 1.4
                color = UIColor.white
            }
            else if (city.1 >= 50 && city.1 <= 89) {
                height = 1.5
                color = UIColor.white
            }
            else if (city.1 >= 90 && city.1 <= 119) {
                height = 1.6
                color = UIColor.red
            }
            else if (city.1 >= 120 && city.1 <= 129) {
                height = 1.7
                color = UIColor.red
            }
            else {
                height = 1.9
                color = UIColor.red
            }
            pyramid.geometry = SCNPyramid(width: 0.05, height: height, length: 0.05)
            pyramid.geometry?.firstMaterial?.diffuse.contents = color
            pyramid.geometry?.firstMaterial?.emission.contents = color
            pyramid.geometry?.firstMaterial?.ambient.contents = color
            pyramid.geometry?.firstMaterial?.reflective.contents = color
            
            
            pyramid.geometry?.firstMaterial?.isDoubleSided = true
            
            let latitude: Float = city.2
            let longitude: Float = city.3
            
            // Rotate according to latitude and longitude
            pyramid.eulerAngles = SCNVector3(x:(90-latitude) * Float((Double.pi)/180.0), y:longitude * Float((Double.pi)/180.0), z:0)
            
            
            self.node.addChildNode(pyramid)
            
            
        }
        
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
