//
//  ViewController.swift
//  NaviApp
//
//  Created by 大和芳隆 on 2016/11/18.
//  Copyright © 2016年 BETA-yamato. All rights reserved.
//: UIViewController

import UIKit
import GoogleMaps


class ViewController: UIViewController,GMSMapViewDelegate,CLLocationManagerDelegate{
    
    
    // GMSMapView *_mapView;
    // CLLocationManager *_locationManager;
    override func viewDidLoad() {
        
        var locationManager: CLLocationManager
        
        super.viewDidLoad()
        
        // // 地図の表示
        let camera = GMSCameraPosition.camera(withLatitude: 35.68154,                                                      longitude: 139.752498, zoom: 13)

        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        self.view = mapView
        
        
        locationManager = CLLocationManager()
        
        // 位置情報サービスが利用できるかどうかをチェック
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            // 測位開始
            locationManager.startUpdatingLocation()
        } else {
            print("Location services not available.")
            
        }
    }
    
    // 位置情報更新時
//    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
//        mapView.animateToLocation(newLocation.coordinate())
//        //緯度・経度を出力
//        print("didUpdateToLocation latitude=\(newLocation.coordinate.latitude), longitude=\(newLocation.coordinate.longitude)")
//    }
    
    // 測位失敗時や、位置情報の利用をユーザーが「不許可」とした場合などに呼ばれる
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("didFailWithError")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


//                let camera = GMSCameraPosition.camera(withLatitude: 35.68154,                                                      longitude: 139.752498, zoom: 13)
//                let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
//                mapView.isMyLocationEnabled = true
//                self.view = mapView
//                
//                let marker = GMSMarker()
//                marker.position = CLLocationCoordinate2DMake(35.68154,139.752498)
//                marker.title = "The Imperial Palace"
//                marker.snippet = "Tokyo"
//                marker.map = mapView
//                

            
                    

