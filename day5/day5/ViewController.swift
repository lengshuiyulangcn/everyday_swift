//
//  ViewController.swift
//  day5
//
//  Created by 李寧 on 2016/09/06.
//  Copyright © 2016年 gyorou. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    let myLocationManager = CLLocationManager()
    let myMapView = MKMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myMapView.frame = self.view.frame
        self.view.addSubview(myMapView)
        myMapView.delegate = self
        self.myLocationManager.delegate = self
        
        let status = CLLocationManager.authorizationStatus()
        if status == CLAuthorizationStatus.NotDetermined {
            // まだ承認が得られていない場合は、認証ダイアログを表示
            myLocationManager.requestAlwaysAuthorization()
        }
        //現在地取得の開始
        myLocationManager.startUpdatingLocation()
        
    
        
        let longPressGesture = UILongPressGestureRecognizer()
        //ボタンを押したときの処理
        longPressGesture.addTarget(self, action: #selector(ViewController.longPressed(_:)))
        myMapView.addGestureRecognizer(longPressGesture)
        
    
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
    }
    
    func longPressed(sender: UILongPressGestureRecognizer) {
        
        //この処理を書くことにより、指を離したときだけ反応するようにする（何回も呼び出されないようになる。最後の話したタイミングで呼ばれる）
        if sender.state != UIGestureRecognizerState.Began {
            return
        }
        
        //senderから長押しした地図上の座標を取得
        let  tappedLocation = sender.locationInView(myMapView)
        let tappedPoint = myMapView.convertPoint(tappedLocation, toCoordinateFromView: myMapView)
        
        //ピンの生成
        let pin = MKPointAnnotation()
        //ピンを置く場所を指定
        pin.coordinate = tappedPoint
        //ピンのタイトルを設定
        pin.title = "タイトル"
        //ピンのサブタイトルの設定
        pin.subtitle = "サブタイトル"
        //ピンをMapViewの上に置く
        self.myMapView.addAnnotation(pin)
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // 配列から現在座標を取得（配列locationsの中から最新のものを取得する）
        let myLocation = locations.last! as CLLocation
        //Pinに表示するためにはCLLocationCoordinate2Dに変換してあげる必要がある
        let currentLocation = myLocation.coordinate
        //ピンの生成と配置
        let pin = MKPointAnnotation()
        pin.coordinate = currentLocation
        pin.title = "現在地"
        self.myMapView.addAnnotation(pin)
        
        //アプリ起動時の表示領域の設定
        //delta数字を大きくすると表示領域も広がる。数字を小さくするとより詳細な地図が得られる。
        let mySpan = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let myRegion = MKCoordinateRegionMake(currentLocation, mySpan)
        myMapView.region = myRegion
    }
    
    //GPSの取得に失敗したときの処理
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print(error)
    }
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        // 認証のステータスをログで表示.
        var statusStr = ""
        switch (status) {
        case .NotDetermined:
            statusStr = "NotDetermined"
        case .Restricted:
            statusStr = "Restricted"
        case .Denied:
            statusStr = "Denied"
        case .AuthorizedAlways:
            statusStr = "AuthorizedAlways"
        case .AuthorizedWhenInUse:
            statusStr = "AuthorizedWhenInUse"
        }
        print(" CLAuthorizationStatus: \(statusStr)")
        
    }
    // add button to popup
    func mapView(mapView: MKMapView, didAddAnnotationViews views: [MKAnnotationView]) {
        for view in views {
            view.rightCalloutAccessoryView = UIButton(type: UIButtonType.DetailDisclosure)
        }
    }
    // navigate to a new view after click the button on popup
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let subView = SubViewController()
        self.navigationController?.pushViewController(subView as UIViewController, animated: true)
    }

}

