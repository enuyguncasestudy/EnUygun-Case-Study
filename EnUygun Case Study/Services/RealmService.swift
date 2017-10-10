//
//  RealmService.swift
//  EnUygun Case Study
//
//  Created by Anıl Sözeri on 06/10/2017.
//  Copyright © 2017 Anıl Sözeri. All rights reserved.
//

import Foundation
import RealmSwift

protocol RealmServiceType {
  func addFlight(with flight: Flight)
  func removeAllFlights()
}

final class RealmService: RealmServiceType {
  func addFlight(with flight: Flight) {
    let realm = try! Realm()
    try! realm.write {
      realm.add(flight, update: true)
    }
  }
  
  func removeAllFlights() {
    let realm = try! Realm()
    try! realm.write {
      realm.deleteAll()
    }
  }
}
