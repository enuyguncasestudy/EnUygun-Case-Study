//
//  FlightSelectionViewModel.swift
//  EnUygun Case Study
//
//  Created by Anıl Sözeri on 05/10/2017.
//  Copyright © 2017 Anıl Sözeri. All rights reserved.
//

import Foundation
import RxSwift

final class FlightSelectionViewModel {
  private let service: EnUygunAPIServiceType
  private let realmService: RealmServiceType
  private let disposeBag: DisposeBag
  
  var flights: Flight?
  var flightCellViewModels: [FlightTableViewCellViewModel]
  let FLIGHT_COUNT: Int = 16
  
  init(service: EnUygunAPIServiceType = EnUygunAPIService(), realmService: RealmServiceType = RealmService()) {
    self.service = service
    self.realmService = realmService
    disposeBag = DisposeBag()
    
    flightCellViewModels = []
    
    service
      .getFlights()
      .subscribe(onNext: { [weak self] flights in
        self?.flights = flights
      })
      .disposed(by: disposeBag)
  }
  
  func saveFlight(with flight: Flight) {
    realmService.removeAllFlights()
    realmService.addFlight(with: flight)
  }
  
  func collapseUnselectedCells(selectedIndex: Int) {
    for (index, cellViewModel) in flightCellViewModels.enumerated() {
      if index != selectedIndex {
        cellViewModel.isExpanded.value = false
      }
    }
  }
  
  func flightCellViewModel(at index: Int) -> FlightTableViewCellViewModel {
    if flightCellViewModels.count == FLIGHT_COUNT {
      return flightCellViewModels[index]
    }
    
    let flightCellViewModel = FlightTableViewCellViewModel()
    flightCellViewModels.append(flightCellViewModel)
    
    return flightCellViewModel
  }
}
