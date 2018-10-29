//
//  ViewControllerTwitLocation.swift
//  Twitter
//
//  Created by Cyrus Illick on 9/19/18.
//  Copyright © 2018 Cyrus Illick. All rights reserved.
//  This is a file for my Twitter API app. This file finds the location using the distance to the state capital.

import Foundation
import UIKit
import MapKit
import CoreLocation
import TwitterKit

class ViewControllerTwitLocation: TWTRTimelineViewController, CLLocationManagerDelegate {
    
    
    let locationManager = CLLocationManager()
    
    //these are the longitude and latitude points of state capitals.
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
    let NewYorkCityX =  40.730610
    let NewYorkCityY = -73.935242
    
    var NewEngland = false
    var MiddleAtlantic = false
    var EastNorthCentral = false
    var WestNorthCentral = false
    var SouthAtlantic = false
    var EastSouthCentral = false
    var WestSouthCental = false
    var Mountain = false
    var Pacific = false
    
    
    
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
            
            //This is the distance formula
            
            func findDist(_ locationX: Double, _ locationY: Double) -> Double{
                let dist = ( sqrt( ((location.coordinate.latitude - locationX)*(location.coordinate.latitude - locationX)) + ((location.coordinate.longitude - (locationY)) * (location.coordinate.longitude - (locationY)))))
                return dist
                
            }

            
            var stateDists: [Double] = []
            
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
            stateDists.append(findDist(NewYorkCityX, NewYorkCityY))
            //to make sure that the index always stays in bound when interating through the list
            stateDists.append(100000.9)
            stateDists.append(100000.9)
            stateDists.append(100000.9)
            stateDists.append(100000.9)
            stateDists.append(100000.9)
            
            
            
            
            
            
            
            
            
            var closestState = stateDists[0]
            var nOS = 0
            for n in 0...50 {
                if (stateDists[n + 1] < stateDists[n]) {
                    if (stateDists[n + 1] < closestState){
                    closestState = stateDists[n + 1]
                    nOS = n + 1
                    }

                }
                
            }

            if (nOS == 0) {
                print("Alabama")
                EastSouthCentral = true
            }
            if (nOS == 1) {
                print("alaska")
                Pacific = true
            }
            if (nOS == 2) {
                print("arizona")
                Mountain = true
            }
            if (nOS == 3) {
                print("arkansas")
                WestSouthCental = true
            }
            if (nOS == 4) {
                print("california")
                Pacific = true
            }
            if (nOS == 5) {
                print("colorado")
                Mountain = true
            }
            if (nOS == 6) {
                print("connecticut")
                NewEngland = true
            }
            if (nOS == 7) {
                print("Delaware")
                SouthAtlantic = true
            }
            if (nOS == 8) {
                print("Florida")
                SouthAtlantic = true
            }
            if (nOS == 9) {
                print("Georgia")
                SouthAtlantic = true
            }
            if (nOS == 10) {
                print("Hawaii")
                Pacific = true
            }
            if (nOS == 11) {
                print("Idaho")
                Mountain = true
            }
            if (nOS == 12) {
                print("Illinois")
                EastNorthCentral = true
            }
            if (nOS == 13) {
                print("Indiana")
                EastNorthCentral = true
            }
            if (nOS == 14) {
                print("Iowa")
                WestNorthCentral = true
            }
            if (nOS == 15) {
                print("Kansas")
                WestNorthCentral = true
            }
            if (nOS == 16) {
                print("Kentucky")
                EastSouthCentral = true
            }
            if (nOS == 17) {
                print("Louisiana")
                WestSouthCental = true
            }
            if (nOS == 18) {
                print("Maine")
                NewEngland = true
            }
            if (nOS == 19) {
                print("Maryland")
                SouthAtlantic = true
            }
            if (nOS == 20) {
                print("Massachusetts")
                NewEngland = true
            }
            if (nOS == 21) {
                print("Michigan")
                EastNorthCentral = true
            }
            if (nOS == 22) {
                print("Minnesota")
                WestNorthCentral = true
            }
            if (nOS == 23) {
                print("Mississippi")
                EastSouthCentral = true
            }
            if (nOS == 24) {
                print("Missouri")
                WestNorthCentral = true
            }
            if (nOS == 25) {
                print("Montana")
                Mountain = true
            }
            if (nOS == 26) {
                print("Nebraska")
                WestNorthCentral = true
            }
            if (nOS == 27) {
                print("Navada")
                Mountain = true
            }
            if (nOS == 28) {
                print("New Hampshire")
                NewEngland = true
            }
            if (nOS == 29) {
                print("New Jersey")
                MiddleAtlantic = true
            }
            if (nOS == 30) {
                print("New Mexico")
                Mountain = true
            }
            if (nOS == 31) {
                print("New York")
                MiddleAtlantic = true
            }
            if (nOS == 32) {
                print("North Carolina")
                SouthAtlantic = true
            }
            if (nOS == 33) {
                print("North Dakota")
                WestNorthCentral = true
            }
            if (nOS == 34) {
                print("Ohio")
                EastNorthCentral = true
            }
            if (nOS == 35) {
                print("Oklahoma")
                WestSouthCental = true
            }
            if (nOS == 36) {
                print("Oregon")
                Pacific = true
            }
            if (nOS == 37) {
                print("Pennsylvania")
                MiddleAtlantic = true
            }
            if (nOS == 38) {
                print("Rhode Island")
                NewEngland = true
            }
            if (nOS == 39) {
                print("South Carolina")
                SouthAtlantic = true
            }
            if (nOS == 40) {
                print("South Dakota")
                WestNorthCentral = true
            }
            if (nOS == 41) {
                print("Tennessee")
                EastSouthCentral = true
            }
            if (nOS == 42) {
                print("Texas")
                WestSouthCental = true
            }
            if (nOS == 43) {
                print("Utah")
                Mountain = true
            }
            if (nOS == 44) {
                print("Vermont")
                NewEngland = true
            }
            if (nOS == 45) {
                print("Virginia")
                SouthAtlantic = true
            }
            if (nOS == 46) {
                print("Washington")
                Pacific = true
            }
            if (nOS == 47) {
                print("West Virginia")
                SouthAtlantic = true
            }
            if (nOS == 48) {
                print("Wisconsin")
                EastNorthCentral = true
            }
            if (nOS == 49) {
                print("Wyoming")
                Mountain = true
            }
            if (nOS == 50) {
                print("newyorkcity")
                NewEngland = true
            }
            
            
            
//
            print(location.coordinate)
            print(stateDists)
            print(stateDists[0])
            

            
            if(MiddleAtlantic == true || NewEngland == true || MiddleAtlantic == true || EastNorthCentral == true || WestNorthCentral == true || SouthAtlantic == true || EastSouthCentral == true || WestSouthCental == true || Mountain == true || Pacific == true) {
            func stopUpdatingLocation() {
                //Once you know where you are, no longer need to look for location
                print("location updating stoped")
            }
            }
            
            if NewEngland == true {
                //display twitter list from this area
                print("trying to show new england tweets")
                let dataSource = TWTRListTimelineDataSource(listSlug: "NewEngland", listOwnerScreenName: "cyrus_illick", apiClient: TWTRAPIClient())
                self.dataSource = dataSource
            }
            if MiddleAtlantic == true {
                print("trying to show middle atlantic  tweets")
                let dataSource = TWTRListTimelineDataSource(listSlug: "MiddleAtlantic", listOwnerScreenName: "cyrus_illick", apiClient: TWTRAPIClient())
                self.dataSource = dataSource
            }
            if EastNorthCentral == true {
                print("trying to show east north central tweets")
                let dataSource = TWTRListTimelineDataSource(listSlug: "EastNorthCentral", listOwnerScreenName: "cyrus_illick", apiClient: TWTRAPIClient())
                self.dataSource = dataSource
            }
            if WestNorthCentral == true {
                print("trying to show west north central tweets")
                let dataSource = TWTRListTimelineDataSource(listSlug: "WestNorthCentral", listOwnerScreenName: "cyrus_illick", apiClient: TWTRAPIClient())
                self.dataSource = dataSource
            }
            if SouthAtlantic == true {
                print("trying to show south atlantic tweets")
                let dataSource = TWTRListTimelineDataSource(listSlug: "SouthAtlantic", listOwnerScreenName: "cyrus_illick", apiClient: TWTRAPIClient())
                self.dataSource = dataSource
            }
            if EastSouthCentral == true {
                print("trying to show east south central tweets")
                let dataSource = TWTRListTimelineDataSource(listSlug: "EastSouthCentral", listOwnerScreenName: "cyrus_illick", apiClient: TWTRAPIClient())
                self.dataSource = dataSource
            }
            if WestSouthCental == true {
                print("trying to show west south central tweets")
                let dataSource = TWTRListTimelineDataSource(listSlug: "WestSouthCentral", listOwnerScreenName: "cyrus_illick", apiClient: TWTRAPIClient())
                self.dataSource = dataSource
            }
            if Mountain == true {
                print("trying to show mountain tweets")
                let dataSource = TWTRListTimelineDataSource(listSlug: "Mountain", listOwnerScreenName: "cyrus_illick", apiClient: TWTRAPIClient())
                self.dataSource = dataSource
            }
            if Pacific == true {
                print("trying to show pacific tweets")
                let dataSource = TWTRListTimelineDataSource(listSlug: "Pacific", listOwnerScreenName: "cyrus_illick", apiClient: TWTRAPIClient())
                self.dataSource = dataSource
            }
            

            
            
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if (status == CLAuthorizationStatus.denied) {
            
            
        }
    }
    
    func showLocationDisabledPopUp() {
        let alertController = UIAlertController(title: "Background Location Access Disabled",
                                                message: "In order to deliver pizza we need your location",
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
    
    func getID() {
        let client = TWTRAPIClient()
        let statusesshowendpoint = "https://api.twitter.com/1.1/lists/show.json?slug=political&owner_screen_name=cyrus_illick"
        var clientError : NSError?
        
        let request = client.urlRequest(withMethod: "GET", urlString: statusesshowendpoint, parameters: [:], error: &clientError)
        
        client.sendTwitterRequest(request) { (response, data, connectionError) -> Void in
            print(response)
            print(data)
            if connectionError != nil {
                print("Error: \(connectionError)")
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                print("json: \(json)")
            } catch let jsonError as NSError {
                print("json error: \(jsonError.localizedDescription)")
            }
        }
    }
    
    
}
