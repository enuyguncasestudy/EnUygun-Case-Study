//
//  FlightTableViewCell.swift
//  EnUygun Case Study
//
//  Created by Anıl Sözeri on 05/10/2017.
//  Copyright © 2017 Anıl Sözeri. All rights reserved.
//

import UIKit
import RxSwift

final class FlightTableViewCell: UITableViewCell {
  @IBOutlet weak var selectFlightButton: UIButton!
  @IBOutlet weak var selectFlightButtonCenterYConstraint: NSLayoutConstraint!
  
  private let ANIMATE_DURATION: TimeInterval = 0.35
  
  private let DEFAULT_SPACE: CGFloat = 8
  private let EXPANDED_SELECT_FLIGHT_BUTTON_CONSTRAINT: CGFloat = 90
  
  var viewModel: FlightTableViewCellViewModel!
  
  override func prepareForReuse() {
    super.prepareForReuse()
  }
  
  func configure(with viewModel: FlightTableViewCellViewModel) {
    self.viewModel = viewModel
  }
  
  func updateSelectFlightButtonConstraint() {
    selectFlightButtonCenterYConstraint.constant = viewModel.isExpanded.value ? EXPANDED_SELECT_FLIGHT_BUTTON_CONSTRAINT - DEFAULT_SPACE : 0
    selectFlightButton.backgroundColor = viewModel.isExpanded.value ? Styles.greenColor : Styles.whiteColor
    selectFlightButton.setTitleColor(viewModel.isExpanded.value ? Styles.whiteColor : Styles.greenColor, for: .normal)
    
    UIView.animate(withDuration: ANIMATE_DURATION) {
      self.layoutIfNeeded()
    }
  }
}
