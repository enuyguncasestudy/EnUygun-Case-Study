//
//  FlightSelectionViewController.swift
//  EnUygun Case Study
//
//  Created by Anıl Sözeri on 05/10/2017.
//  Copyright © 2017 Anıl Sözeri. All rights reserved.
//

import UIKit

final class FlightSelectionViewController: UIViewController {
  @IBOutlet weak var flightsTableView: UITableView!
  
  fileprivate let COLLAPSED_CELL_HEIGHT: CGFloat = 110
  fileprivate let EXPANDED_CELL_HEIGHT: CGFloat = 200
  
  fileprivate let flightTableViewCellIdentifier: String = "FlightTableViewCell"
  
  fileprivate let viewModel = FlightSelectionViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    flightsTableView.rowHeight = UITableViewAutomaticDimension 
  }
  
  // MARK: Action Functions
  
  @IBAction func selectFlight(_ sender: UIButton) {
//    viewModel.saveFlight(with: Flight())
  }
}

extension FlightSelectionViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: flightTableViewCellIdentifier, for: indexPath) as! FlightTableViewCell
    
    cell.configure(with: viewModel.flightCellViewModel(at: indexPath.item))
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.FLIGHT_COUNT
  }
}

extension FlightSelectionViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if viewModel.flightCellViewModels.count > indexPath.item && viewModel.flightCellViewModels[indexPath.item].isExpanded.value {
      return EXPANDED_CELL_HEIGHT
    }
    
    return COLLAPSED_CELL_HEIGHT
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let selectedCell = tableView.cellForRow(at: indexPath) as! FlightTableViewCell
    selectedCell.viewModel.isExpanded.value = !selectedCell.viewModel.isExpanded.value
    selectedCell.updateSelectFlightButtonConstraint()
    viewModel.collapseUnselectedCells(selectedIndex: indexPath.item)
    tableView.beginUpdates()
    tableView.endUpdates()
  }
  
  func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    guard let unselectedCell = tableView.cellForRow(at: indexPath) as? FlightTableViewCell else { return }
    unselectedCell.viewModel.isExpanded.value = false
    unselectedCell.updateSelectFlightButtonConstraint()
  }
}
