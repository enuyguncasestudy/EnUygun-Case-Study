//
//  FlightTableViewCellViewModel.swift
//  EnUygun Case Study
//
//  Created by Anıl Sözeri on 05/10/2017.
//  Copyright © 2017 Anıl Sözeri. All rights reserved.
//

import Foundation
import RxSwift

final class FlightTableViewCellViewModel {
  var isExpanded: Variable<Bool>
  
  init() {
    isExpanded = Variable<Bool>(false)
  }
}
