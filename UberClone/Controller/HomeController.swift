//
//  HomeController.swift
//  UberClone
//
//  Created by Jonathan Go on 5/30/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import UIKit
import Firebase
import MapKit

class HomeController: UIViewController {
  // MARK: - Properties
  private let mapView = MKMapView()
  private let locationManager = CLLocationManager()
  
  private let inputActivationView = LocationInputActivationView()
  private let locationInputView = LocationInputView()
  private let tableView = UITableView()
  
  private final let locationInputViewHeight: CGFloat = 200
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
   
    checkIfUserIsLoggedIn()
    enableLocationServices()
    //signOut()
  }
  
  // MARK: - API
  func checkIfUserIsLoggedIn() {
    if Auth.auth().currentUser?.uid == nil {
      DispatchQueue.main.async {
        let nav = UINavigationController(rootViewController: LoginController())
        self.present(nav, animated: false, completion: nil)
      }
      print("User not logged in")
    } else {
      configureUI()
    }
  }
  
  func signOut() {
    do {
      try Auth.auth().signOut()
    } catch {
      print("error signing out")
    }
  }
  
  // MARK: - Helper Functions
  func configureUI() {
    configureNavBar()
    configureMapView()
    
    view.addSubview(inputActivationView)
    inputActivationView.centerX(inView: view)
    inputActivationView.setDimensions(height: 50, width: view.frame.width - 64)
    inputActivationView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
    inputActivationView.alpha = 0
    inputActivationView.delegate = self
    
    UIView.animate(withDuration: 2) {
      self.inputActivationView.alpha = 1
    }
    
    configureTableView()
  }
  
  func configureNavBar() {
    navigationController?.navigationBar.isHidden = true
    navigationController?.navigationBar.barStyle = .black
  }
  
  func configureMapView() {
    view.addSubview(mapView)
    mapView.frame = view.frame
    
    mapView.showsUserLocation = true
    mapView.userTrackingMode = .follow
  }
  
  func configureLocationInputView() {
    locationInputView.delegate = self
    view.addSubview(locationInputView)
    locationInputView.anchor(top: view.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, height: locationInputViewHeight)
    locationInputView.alpha = 0
    
    UIView.animate(withDuration: 0.5, animations: {
      self.locationInputView.alpha = 1
    }) { (_) in
      UIView.animate(withDuration: 0.3) {
        self.tableView.frame.origin.y = self.locationInputViewHeight
      }
    }
  }
  
  func configureTableView() {
    tableView.delegate = self
    tableView.dataSource = self
    
    tableView.register(LocationCell.self, forCellReuseIdentifier: LocationCell.reuseIdentifier)
    tableView.rowHeight = 60
    tableView.tableFooterView = UIView()
    
    let height = view.frame.height - locationInputViewHeight
    tableView.frame = CGRect(x: 0, y: view.frame.height, width: view.frame.width, height: height)
    
    view.addSubview(tableView)
  }
}

// MARK: - Location Services
extension HomeController: CLLocationManagerDelegate {
  func enableLocationServices() {
    locationManager.delegate = self
    
    switch CLLocationManager.authorizationStatus() {
    case .notDetermined:
      print("Not determined")
      locationManager.requestWhenInUseAuthorization()
    case .restricted, .denied:
      break
    case .authorizedAlways:
      print("Auth always")
      locationManager.startUpdatingLocation()
      locationManager.desiredAccuracy = kCLLocationAccuracyBest
    case .authorizedWhenInUse:
      print("Auth when in use")
      locationManager.requestAlwaysAuthorization()
    default:
      break
    }
  }
  
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    if status == .authorizedWhenInUse {
      locationManager.requestAlwaysAuthorization()
    }
  }
}


// MARK: - LocationInputActivationViewDelegate
extension HomeController: LocationInputActivationViewDelegate {
  func pressentLocationInputView() {
    inputActivationView.alpha = 0
    configureLocationInputView()
  }
}


// MARK: - LocationInputViewDelegate
extension HomeController: LocationInputViewDelegate {
  func dismissLocationInputView() {
     UIView.animate(withDuration: 0.3, animations: {
      self.locationInputView.alpha = 0
      self.tableView.frame.origin.y = self.view.frame.height
    }) { _ in
      UIView.animate(withDuration: 0.3) {
        self.locationInputView.removeFromSuperview()
        self.inputActivationView.alpha = 1
      }
      
    }
  }
}


// MARK: - UITableViewDataSource, UITableViewDelegate
extension HomeController: UITableViewDataSource, UITableViewDelegate {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return section == 0 ? 2 : 5
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Test"
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: LocationCell.reuseIdentifier, for: indexPath) as! LocationCell
    
    return cell
  }
}
