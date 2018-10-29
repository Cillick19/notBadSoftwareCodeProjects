//
//  ViewControllerDistance.swift
//  Twitter
//
//  Created by Cyrus Illick on 9/20/18.
//  Copyright © 2018 Cyrus Illick. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

class ViewControllerDistance: UITableViewController, CLLocationManagerDelegate {
   
    
//    var closestState1: String = ""
//    var distToCapital: String = ""
    
    
    
    var list = [String]()
    

    
    
    
    let locationManager = CLLocationManager()
    
    let AlabamaX = 32.361538
    let AlabamaY = -86.279118
    let AlaskaX = 58.301935
    let AlaskaY = -134.419740
    let ArizonaX = 33.448457
    let ArizonaY = -112.073844
    let ArkansasX = 34.736009
    let ArkansasY = -92.331122
    let CaliforniaX = 38.555605
    let CaliforniaY = -121.468926
    let ColoradoX = 39.7391667
    let ColoradoY = -104.984167
    let ConnecticutX = 41.597782
    let ConnecticutY = -72.755371
    let DelawareX = 39.161921
    let DelewareY = -75.526755
    let FloridaX = 30.4518
    let FloridaY = -84.27277
    let GeorgiaX = 33.76
    let GeorgiaY = -84.39
    let HawaiiX = 21.30895
    let HawaiiY = -157.826182
    let IdahoX = 43.613739
    let IdahoY = -116.237651
    let IllinoisX = 39.783250
    let IllinoisY = -89.650373
    let IndianaX = 39.790942
    let IndianaY = -86.147685
    let IowaX = 41.590939
    let IowaY = -93.620866
    let KansasX = 39.04
    let KansasY = -95.69
    let KentuckyX = 38.197274
    let KentuckyY = -84.86311
    let LouisianaX = 30.45809
    let LouisianaY = -91.140229
    let MaineX = 44.323535
    let MaineY = -69.765261
    let MarylandX = 38.972945
    let MarylandY = -76.501157
    let MassachusettsX = 42.2352
    let MassachusettsY = -71.0275
    let MichiganX = 42.7335
    let MichiganY = -84.5467
    let MinnesotaX = 44.95
    let MinnesotaY = -93.094
    let MississippiX = 32.320
    let MississippiY = -90.207
    let MissouriX = 38.572954
    let MissouriY = -92.189283
    let MontanaX = 46.595805
    let MontanaY = -112.027031
    let NebraskaX = 40.809868
    let NebraskaY = -96.675345
    let NevadaX = 39.160949
    let NevadaY = -119.753877
    let NewHampshireX = 43.220093
    let NewHampshireY = -71.549127
    let NewJerseyX = 40.221741
    let NewJerseyY = -74.756138
    let NewMexicoX = 35.667231
    let NewMexicoY = -105.964575
    let NewYorkX = 42.659829
    let NewYorkY = -73.781339
    let NorthCarolinaX = 35.771
    let NorthCarolinaY = -78.638
    let NorthDakotaX = 48.813343
    let NorthDakotaY = -100.779004
    let OhioX = 39.962245
    let OhioY = -83.000647
    let OklahomaX = 35.482309
    let OklahomaY = -97.534994
    let OregonX = 44.931109
    let OregonY = -123.029159
    let PennsylvaniaX = 40.269789
    let PennsylvaniaY = -76.875613
    let RhodeIslandX = 41.82355
    let RhodeIslandY = -71.422132
    let SouthCarolinaX = 34.000
    let SouthCarolinaY = -81.035
    let SouthDakotaX = 44.367966
    let SouthDakotaY = -100.336378
    let TennesseeX = 36.165
    let TennesseeY = -86.784
    let TexasX = 30.266667
    let TexasY = -97.75
    let UtahX = 40.7547
    let UtahY = -111.892622
    let VermontX = 44.26639
    let VermontY = -72.57194
    let VirginiaX = 37.54
    let VirginiaY = -77.46
    let WashingtonX = 47.042418
    let WashingtonY = -122.893077
    let WestVirginaX = 38.349497
    let WestVirginiaY = -81.633294
    let WisconsinX = 43.074722
    let WisconsinY = -89.384444
    let WyomingX = 41.145548
    let WyomingY = -104.802042
    
    
    var senatorClosest:String = ""
    
    @IBOutlet weak var senator: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //when is app is open and in the background
        //locationManager.requestAlwaysAuthorization()
        
        //for use when the app is open
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
            
        }
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            
            print(location.coordinate)
            
            func findDist(_ locationX: Double, _ locationY: Double) -> Double{
                let dist = ( sqrt( ((location.coordinate.latitude - locationX)*(location.coordinate.latitude - locationX)) + ((location.coordinate.longitude - (locationY)) * (location.coordinate.longitude - (locationY)))))
                return dist
                
            }
            
            //  let ConnecticutDist = ( sqrt( ((location.coordinate.latitude - ConnecticutX)*(location.coordinate.latitude - ConnecticutX)) + ((location.coordinate.longitude - (ConnecticutY)) * (location.coordinate.longitude - (ConnecticutY)))))
            
            var stateDists: [Double] = []
            
            var capitalDistMeters = [Double]()
            
            //let ConnecticutDist = findDist(ConnecticutX, ConnecticutY)
            //StateDists.append(findDist(ConnecticutX, ConnecticutY))
            
            stateDists.append(findDist(AlabamaX, AlabamaY))
            stateDists.append(findDist(AlaskaX, AlaskaY))
            stateDists.append(findDist(ArizonaX, ArizonaY))
            stateDists.append(findDist(ArkansasX, ArkansasY))
            stateDists.append(findDist(CaliforniaX, CaliforniaY))
            stateDists.append(findDist(ColoradoX, ColoradoY))
            stateDists.append(findDist(ConnecticutX, ConnecticutY))
            stateDists.append(findDist(DelawareX, DelewareY))
            stateDists.append(findDist(FloridaX, FloridaY))
            stateDists.append(findDist(GeorgiaX, GeorgiaY))
            stateDists.append(findDist(HawaiiX, HawaiiY))
            stateDists.append(findDist(IdahoX, IdahoY))
            stateDists.append(findDist(IllinoisX, IllinoisY))
            stateDists.append(findDist(IndianaX, IndianaY))
            stateDists.append(findDist(IowaX, IowaY))
            stateDists.append(findDist(KansasX, KansasY))
            stateDists.append(findDist(KentuckyX, KentuckyY))
            stateDists.append(findDist(LouisianaX, LouisianaY))
            stateDists.append(findDist(MaineX, MaineY))
            stateDists.append(findDist(MarylandX, MarylandY))
            stateDists.append(findDist(MassachusettsX, MassachusettsY))
            stateDists.append(findDist(MichiganX, MichiganY))
            stateDists.append(findDist(MinnesotaX, MinnesotaY))
            stateDists.append(findDist(MississippiX, MississippiY))
            stateDists.append(findDist(MissouriX, MissouriY))
            stateDists.append(findDist(MontanaX, MontanaY))
            stateDists.append(findDist(NebraskaX, NebraskaY))
            stateDists.append(findDist(NevadaX, NevadaY))
            stateDists.append(findDist(NewHampshireX, NewHampshireY))
            stateDists.append(findDist(NewJerseyX, NewJerseyY))
            stateDists.append(findDist(NewMexicoX, NewMexicoY))
            stateDists.append(findDist(NewYorkX, NewYorkY))
            stateDists.append(findDist(NorthCarolinaX, NorthCarolinaY))
            stateDists.append(findDist(NorthDakotaX, NorthDakotaY))
            stateDists.append(findDist(OhioX, OhioY))
            stateDists.append(findDist(OklahomaX, OklahomaY))
            stateDists.append(findDist(OregonX, OregonY))
            stateDists.append(findDist(PennsylvaniaX, PennsylvaniaY))
            stateDists.append(findDist(RhodeIslandX, RhodeIslandY))
            stateDists.append(findDist(SouthCarolinaX, SouthCarolinaY))
            stateDists.append(findDist(SouthDakotaX, SouthDakotaY))
            stateDists.append(findDist(TennesseeX, TennesseeY))
            stateDists.append(findDist(TexasX, TexasY))
            stateDists.append(findDist(UtahX, UtahY))
            stateDists.append(findDist(VermontX, VermontY))
            stateDists.append(findDist(VirginiaX, VirginiaY))
            stateDists.append(findDist(WashingtonX, WashingtonY))
            stateDists.append(findDist(WestVirginaX, WestVirginiaY))
            stateDists.append(findDist(WisconsinX, WisconsinY))
            stateDists.append(findDist(WyomingX, WyomingY))
            //to make sure that the index always stays in bound when interating through the list
            stateDists.append(100000.9)
            stateDists.append(100000.9)
            stateDists.append(100000.9)
            stateDists.append(100000.9)
            stateDists.append(100000.9)
            
            
            
            
            
         
            
            
            var closestState1: String = ""
            
            var closestState = stateDists[0]
            var nOS = 0
            for n in 0...50 {
                if (stateDists[n + 1] < stateDists[n]) {
                    closestState = stateDists[n + 1]
                    nOS = n + 1
                    print(nOS)
                    print(closestState)
                }
                
            }
            //
            //            print(nOS)
            //            print(closestState)
            if (nOS == 0) {
                print("Alabama")
                closestState1 = "Alabama"
            }
            if (nOS == 1) {
                print("alaska")
                closestState1 = "Alaska"
            }
            if (nOS == 2) {
                print("arizona")
                closestState1 = "Arizona"
            }
            if (nOS == 3) {
                print("arkansas")
                closestState1 = "Arkansas"
            }
            if (nOS == 4) {
                print("california")
                closestState1 = "California"
            }
            if (nOS == 5) {
                print("colorado")
                closestState1 = "Colorado"
            }
            if (nOS == 6) {
                print("connecticut")
                closestState1 = "Connecticut"
            }
            if (nOS == 7) {
                print("Delaware")
                closestState1 = "Delaware"
            }
            if (nOS == 8) {
                print("Florida")
                closestState1 = "Florida"
            }
            if (nOS == 9) {
                print("Georgia")
                closestState1 = "Georgia"
            }
            if (nOS == 10) {
                print("Hawaii")
                closestState1 = "Hawaii"
                
            }
            if (nOS == 11) {
                print("Idaho")
                closestState1 = "Idaho"
            }
            if (nOS == 12) {
                print("Illinois")
                closestState1 = "Illinois"
            }
            if (nOS == 13) {
                print("Indiana")
                closestState1 = "Indiana"
            }
            if (nOS == 14) {
                print("Iowa")
                closestState1 = "Iowa"
            }
            if (nOS == 15) {
                print("Kansas")
                closestState1 = "Kansas"
            }
            if (nOS == 16) {
                print("Kentucky")
                closestState1 = "Kentucky"
            }
            if (nOS == 17) {
                print("Louisiana")
                closestState1 = "Louisiana"
            }
            if (nOS == 18) {
                print("Maine")
                closestState1 = "Maine"
            }
            if (nOS == 19) {
                print("Maryland")
                closestState1 = "Maryland"
            }
            if (nOS == 20) {
                print("Massachusetts")
                closestState1 = "Massachusetts"
            }
            if (nOS == 21) {
                print("Michigan")
                closestState1 = "Michigan"
            }
            if (nOS == 22) {
                print("Minnesota")
                closestState1 = "Minnesota"
            }
            if (nOS == 23) {
                print("Mississippi")
                closestState1 = "Mississippi"
            }
            if (nOS == 24) {
                print("Missouri")
                closestState1 = "Missouri"
            }
            if (nOS == 25) {
                print("Montana")
                closestState1 = "Montana"
            }
            if (nOS == 26) {
                print("Nebraska")
                closestState1 = "Nebraska"
            }
            if (nOS == 27) {
                print("Navada")
                closestState1 = "Navada"
            }
            if (nOS == 28) {
                print("New Hampshire")
                closestState1 = "New Hampshire"
            }
            if (nOS == 29) {
                print("New Jersey")
                closestState1 = "New Jersey"
            }
            if (nOS == 30) {
                print("New Mexico")
                closestState1 = "New Mexico"
            }
            if (nOS == 31) {
                print("New York")
                closestState1 = "New York"
            }
            if (nOS == 32) {
                print("North Carolina")
                closestState1 = "North Carolina"
            }
            if (nOS == 33) {
                print("North Dakota")
                closestState1 = "North Dakota"
            }
            if (nOS == 34) {
                print("Ohio")
                closestState1 = "Ohio"
            }
            if (nOS == 35) {
                print("Oklahoma")
                closestState1 = "Oklahoma"
            }
            if (nOS == 36) {
                print("Oregon")
                closestState1 = "Oregon"
            }
            if (nOS == 37) {
                print("Pennsylvania")
                closestState1 = "Pennsylvania"
            }
            if (nOS == 38) {
                print("Rhode Island")
                closestState1 = "Rhode Island"
            }
            if (nOS == 39) {
                print("South Carolina")
                closestState1 = "South Carolina"
            }
            if (nOS == 40) {
                print("South Dakota")
                closestState1 = "South Dakota"
            }
            if (nOS == 41) {
                print("Tennessee")
                closestState1 = "Tennessee"
            }
            if (nOS == 42) {
                print("Texas")
                closestState1 = "Texas"
            }
            if (nOS == 43) {
                print("Utah")
                closestState1 = "Utah"
            }
            if (nOS == 44) {
                print("Vermont")
                closestState1 = "Vermont"
            }
            if (nOS == 45) {
                print("Virginia")
                closestState1 = "Virginia"
            }
            if (nOS == 46) {
                print("Washington")
                closestState1 = "Washington"
            }
            if (nOS == 47) {
                print("West Virginia")
                closestState1 = "West Virginia"
            }
            if (nOS == 48) {
                print("Wisconsin")
                closestState1 = "Wisconsin"
            }
            if (nOS == 49) {
                print("Wyoming")
                closestState1 = "Wyoming"
            }
            
            var Capitals = ["Montgomery", "Juneau", "Phoenix", "Little Rock", "Sacremento", "Denver", "Hartford", "Dover", "Tallahassee", "Atlanta", "Honolulu", "Boise", "Springfield", "Indianapolis", "Des Moines", "Topeka", "Frankfort", "Baton Rouge", "Augusta", "Annapolis", "Boston", "Lansing", "St. Paul", "Jackson", "Jefferson City", "Helena", "Lincoln", "Carson City", "Concord", "Treton", "Santa Fe", "Albany", "Raleigh", "Bismark", "Columbus", "Oklahoma City", "Salem", "Harrisburg", "Providence", "Columbia", "Pierre", "Nashville", "Austin", "Salt Lake City", "MontPelier", "Richmond", "Olympia", "Charleston", "Madison", "Cheyenne"]
            
            var States = ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"]
            
            
            
            func prepareList( _ State: String, _ Distance: Double, _ Capital: String) -> String {
                
                return "State: \(State), Capital: \(Capital), Distance to capital In Meters: \(Distance)"
                
                
            }
            
            print(list)
            

            
            
            
            
            
            print(location.coordinate)
            print(stateDists)
            print(stateDists[0])
            
            //let coordinateOfAlaska = CLLocation(latitude: AlaskaX, longitude: AlaskaY)
            
            
            let coordinateOfUser = CLLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.latitude)
            
            //let distanceToAlaska = coordinateOfUser.distance(from: CLLocation(latitude: AlaskaX, longitude: AlaskaY))
            
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: AlabamaX, longitude: AlabamaY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: AlaskaX, longitude: AlaskaY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: ArizonaX, longitude: ArizonaY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: ArkansasX, longitude: ArkansasY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: CaliforniaX, longitude: CaliforniaY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: ColoradoX, longitude: ColoradoY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: ConnecticutX, longitude: ConnecticutY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: DelawareX, longitude: DelawareX)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: FloridaX, longitude: FloridaY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: GeorgiaX, longitude: GeorgiaY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: HawaiiX, longitude: HawaiiY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: IdahoX, longitude: IdahoY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: IllinoisX, longitude: IllinoisY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: IndianaX, longitude: IndianaY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: IowaX, longitude: IowaY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: KansasX, longitude: KansasY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: KentuckyX, longitude: KentuckyY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: LouisianaX, longitude: LouisianaY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: MaineX, longitude: MaineY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: MarylandX, longitude: MarylandY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: MassachusettsX, longitude: MassachusettsY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: MichiganX, longitude: MichiganY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: MinnesotaX, longitude: MinnesotaY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: MississippiX, longitude: MississippiY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: MissouriX, longitude: MissouriY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: MissouriX, longitude: MissouriY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: MontanaX, longitude: MontanaY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: NebraskaX, longitude: NebraskaY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: NevadaX, longitude: NevadaY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: NewHampshireX, longitude: NewHampshireY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: NewJerseyX, longitude: NewJerseyY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: NewMexicoX, longitude: NewMexicoY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: NewYorkX, longitude: NewYorkY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: NorthCarolinaX, longitude: NorthCarolinaY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: NorthDakotaX, longitude: NorthDakotaY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: OhioX, longitude: OhioY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: OklahomaX, longitude: OklahomaY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: OregonX, longitude: OregonY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: PennsylvaniaX, longitude: PennsylvaniaY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: RhodeIslandX, longitude: RhodeIslandY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: SouthCarolinaX, longitude: SouthCarolinaY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: SouthDakotaX, longitude: SouthDakotaY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: TennesseeX, longitude: TennesseeY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: TexasX, longitude: TexasY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: UtahX, longitude: UtahY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: VermontX, longitude: VermontY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: VirginiaX, longitude: VirginiaY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: WashingtonX, longitude: WashingtonY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: WestVirginaX, longitude: WestVirginiaY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: WisconsinX, longitude: WisconsinY)))
            capitalDistMeters.append(coordinateOfUser.distance(from: CLLocation(latitude: WyomingX, longitude: WyomingY)))
            
   
            for n in 0...49 {
                list.append(prepareList(States[n], capitalDistMeters[n], Capitals[n]))
            }
            self.tableView.reloadData()
            
            //print(distanceToAlaska)
            
            
            
        
            
            
            
            
            
            
            
            
            
            
//            senatorClosest = "\(closestState)"
//
//            senator.text = senatorClosest
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if (status == CLAuthorizationStatus.denied) {
            
            
        }
    }
    
    func showLocationDisabledPopUp() {
        let alertController = UIAlertController(title: "Background Location Access Disabled",
                                                message: "We need your location",
                                                preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let openAction = UIAlertAction(title: "Open Settings", style: .default) { (action) in
            if let url = URL(string: UIApplicationOpenSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        alertController.addAction(openAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(list.count)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = self.tableView.dequeueReusableCell(withIdentifier: "listycell") as? ListycellTableViewCell {
            cell.label.text = list[indexPath.row]
            return(cell)
        }
        return UITableViewCell()
    }

    
    
}



