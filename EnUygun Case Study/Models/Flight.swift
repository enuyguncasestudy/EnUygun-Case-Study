//
//  Flight.swift
//  EnUygun Case Study
//
//  Created by Anıl Sözeri on 05/10/2017.
//  Copyright © 2017 Anıl Sözeri. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper
import ObjectMapper_Realm

final class Flight: Object, Mappable {
  dynamic var identifier: String = "" // flights.departure.x.enuid
  dynamic var logoUrlString: String = "" // airlines.PC/TK/AJ.image
  dynamic var airlinesName: String = "" // airlines.PC/TK/AJ.name
  dynamic var airportCode: String = "" // airports.SAW/IST/ESB.aiport_code
  dynamic var airportName: String = "" // airports.SAW/IST/ESB.aiport_name
  dynamic var flightNumber: String = "" // flights.departure.x.segments.0.flight_number
  dynamic var originAirport: String = "" // flights.departure.x.segments.0.origin
  dynamic var destinationAirport: String = "" // flights.departure.x.segments.0.destination
  dynamic var day: Int = 0 // flights.departure.x.segments.0.duration.day
  dynamic var hour: Int = 0 // flights.departure.x.segments.0.duration.hour
  dynamic var minutes: Int = 0 // flights.departure.x.segments.0.duration.minute
  dynamic var totalMinutes: Int = 0 // flights.departure.x.segments.0.duration.total_minutes
  dynamic var detailPrice: Double = 0 // flights.departure.x.segments.0.detail_price
  dynamic var priceCurrency: String = "" // flights.departure.x.segments.0.price_currency
  dynamic var isPromo: Bool = false // flights.departure.x.infos.is_promo
  dynamic var departureDate: Date = Date() // flights.departure.x.segments.0.departure_datetime.date
  dynamic var departureTime: Date = Date() // flights.departure.x.segments.0.departure_datetime.time
  dynamic var arrivalDate: Date = Date() // flights.departure.x.segments.0.arrival_datetime.date
  dynamic var arrivalTime: Date = Date() // flights.departure.x.segments.0.arrival_datetime.time
  
  required convenience init?(map: Map) {
    self.init()
  }
  
  func mapping(map: Map) {
    identifier <- map["flight.departure.0.enuid"]
    logoUrlString <- map["airlines.PC.image"]
    // Doing same for all variables.
  }
}
