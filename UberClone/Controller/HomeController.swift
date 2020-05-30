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
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
   
    checkIfUserIsLoggedIn()
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
    view.addSubview(mapView)
    mapView.frame = view.frame
  }
}
