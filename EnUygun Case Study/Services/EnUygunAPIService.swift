//
//  EnUygunAPIService.swift
//  EnUygun Case Study
//
//  Created by Anıl Sözeri on 05/10/2017.
//  Copyright © 2017 Anıl Sözeri. All rights reserved.
//

import Foundation
import RxSwift
import ObjectMapper

protocol EnUygunAPIServiceType {
  func readJsonFile() -> [String: Any]?
  func getFlights() -> Observable<Flight?>
}

final class EnUygunAPIService: EnUygunAPIServiceType {
  func readJsonFile() -> [String: Any]? {
    guard let path = Bundle.main.path(forResource: "SearchResults", ofType: "json"),
      let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped),
      let jsonDictionary = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as? [String: Any] else { return nil }
    
    return jsonDictionary
  }
  
  func getFlights() -> Observable<Flight?> {
    guard let jsonDictionary = readJsonFile() else { return Observable.empty() }
    let flight = Mapper<Flight>().map(JSON: jsonDictionary)
    
    return Observable.just(flight)
  }
}
